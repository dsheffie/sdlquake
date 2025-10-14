// vid_sdl.h -- sdl video driver 

#include "quakedef.h"
#include "d_local.h"
#include <sys/mman.h>


viddef_t    vid;                // global video state
unsigned short  d_8to16table[256];

// The original defaults
#define    BASEWIDTH    320
#define    BASEHEIGHT   200

int    VGA_width, VGA_height, VGA_rowbytes, VGA_bufferrowbytes = 0;
byte    *VGA_pagebase;

/*static SDL_Surface *screen = NULL; */

static qboolean mouse_avail;
static float   mouse_x, mouse_y;
static int mouse_oldbuttonstate = 0;

// No support for option menus
void (*vid_menudrawfn)(void) = NULL;
void (*vid_menukeyfn)(int key) = NULL;

#define __asm_syscall(...) \
        __asm__ __volatile__ ("ecall\n\t" \
        : "+r"(a0) : __VA_ARGS__ : "memory"); \
	return a0; \

#ifdef __aarch64__
static inline long va2pa(void *a) { return 0x600000; }
#else
static inline long va2pa(void *a)
{
  register long a7 __asm__("a7") = 257;
  register long a0 __asm__("a0") = (uintptr_t)a;
  __asm_syscall("r"(a7), "0"(a0))
}
#endif


static void* mmap_mem(size_t n_bytes) {
  void *ptr = NULL;
  if(n_bytes > getpagesize()) {
    ptr = mmap(0, n_bytes, PROT_READ|PROT_WRITE, MAP_ANON | MAP_PRIVATE | MAP_HUGETLB, -1, 0);
  }
  if(ptr == (void*)(-1L) || ptr == NULL ) {
    ptr = mmap(0, n_bytes, PROT_READ|PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
  }
  printf("buffer of size %zu starts at %p, mapped to phys addr %lx\n", n_bytes, ptr, va2pa(ptr));
  return ptr;
}



void    VID_SetPalette (unsigned char *palette)
{
#if 0
    int i;
    SDL_Color colors[256];

    for ( i=0; i<256; ++i )
    {
        colors[i].r = *palette++;
        colors[i].g = *palette++;
        colors[i].b = *palette++;
    }
    SDL_SetColors(screen, colors, 0, 256);
#endif
}

void    VID_ShiftPalette (unsigned char *palette)
{
    VID_SetPalette(palette);
}




void    VID_Init (unsigned char *palette)
{
    int pnum, chunk;
    byte *cache;
    int cachesize;
    uint8_t video_bpp;
    uint16_t video_w, video_h;
    uint32_t flags;


    // Set up display mode (width and height)
    vid.width = BASEWIDTH;
    vid.height = BASEHEIGHT;
    vid.maxwarpwidth = WARP_WIDTH;
    vid.maxwarpheight = WARP_HEIGHT;

    // check for command-line window size
    if ((pnum=COM_CheckParm("-winsize")))
    {
        if (pnum >= com_argc-2)
            Sys_Error("VID: -winsize <width> <height>\n");
        vid.width = Q_atoi(com_argv[pnum+1]);
        vid.height = Q_atoi(com_argv[pnum+2]);
        if (!vid.width || !vid.height)
            Sys_Error("VID: Bad window width/height\n");
    }
    if ((pnum=COM_CheckParm("-width"))) {
        if (pnum >= com_argc-1)
            Sys_Error("VID: -width <width>\n");
        vid.width = Q_atoi(com_argv[pnum+1]);
        if (!vid.width)
            Sys_Error("VID: Bad window width\n");
    }
    if ((pnum=COM_CheckParm("-height"))) {
        if (pnum >= com_argc-1)
            Sys_Error("VID: -height <height>\n");
        vid.height = Q_atoi(com_argv[pnum+1]);
        if (!vid.height)
            Sys_Error("VID: Bad window height\n");
    }

    // Set video width, height and flags
#if 0
    flags = (SDL_SWSURFACE|SDL_HWPALETTE|SDL_FULLSCREEN);

    
    if ( COM_CheckParm ("-fullscreen") )
        flags |= SDL_FULLSCREEN;

    if ( COM_CheckParm ("-window") ) {
        flags &= ~SDL_FULLSCREEN;
    }
#endif
    // Initialize display
#if 0
    if (!(screen = SDL_SetVideoMode(vid.width, vid.height, 8, flags)))
        Sys_Error("VID: Couldn't set video mode: %s\n", SDL_GetError());
#endif

    VID_SetPalette(palette);
#if 0
    SDL_WM_SetCaption("sdlquake","sdlquake");
#endif
    // now know everything we need to know about the buffer
    VGA_width = vid.conwidth = vid.width;
    VGA_height = vid.conheight = vid.height;
    vid.aspect = 1;
    vid.numpages = 1;
    vid.colormap = host_colormap;
    vid.fullbright = 256 - LittleLong (*((int *)vid.colormap + 2048));
#if 0
    VGA_pagebase = vid.buffer = screen->pixels;
    VGA_rowbytes = vid.rowbytes = screen->pitch;
#endif

    VGA_pagebase = vid.buffer = mmap_mem(vid.width*vid.height*sizeof(uint16_t));
    VGA_rowbytes = vid.rowbytes = vid.width*sizeof(uint16_t);
    
    vid.conbuffer = vid.buffer;
    vid.conrowbytes = vid.rowbytes;
    vid.direct = 0;
    
    // allocate z buffer and surface cache
    chunk = vid.width * vid.height * sizeof (*d_pzbuffer);
    cachesize = D_SurfaceCacheForRes (vid.width, vid.height);
    chunk += cachesize;
    d_pzbuffer = Hunk_HighAllocName(chunk, "video");
    if (d_pzbuffer == NULL)
        Sys_Error ("Not enough memory for video mode\n");

    // initialize the cache memory 
        cache = (byte *) d_pzbuffer
                + vid.width * vid.height * sizeof (*d_pzbuffer);
    D_InitCaches (cache, cachesize);


}

void    VID_Shutdown (void)
{}

void    VID_Update (vrect_t *rects)
{
#if 0
    SDL_Rect *sdlrects;
    int n, i;
    vrect_t *rect;

    // Two-pass system, since Quake doesn't do it the SDL way...

    // First, count the number of rectangles
    n = 0;
    for (rect = rects; rect; rect = rect->pnext)
        ++n;

    // Second, copy them to SDL rectangles and update
    if (!(sdlrects = (SDL_Rect *)alloca(n*sizeof(*sdlrects))))
        Sys_Error("Out of memory");
    i = 0;
    for (rect = rects; rect; rect = rect->pnext)
    {
        sdlrects[i].x = rect->x;
        sdlrects[i].y = rect->y;
        sdlrects[i].w = rect->width;
        sdlrects[i].h = rect->height;
        ++i;
    }
    SDL_UpdateRects(screen, n, sdlrects);
#endif
}

/*
================
D_BeginDirectRect
================
*/
void D_BeginDirectRect (int x, int y, byte *pbitmap, int width, int height)
{
#if 0  
    uint8_t *offset;


    if (!screen) return;

    if ( x < 0 ) x = screen->w+x-1;
    offset = (uint8_t *)screen->pixels + y*screen->pitch + x;
    while ( height-- )
    {
        memcpy(offset, pbitmap, width);
        offset += screen->pitch;
        pbitmap += width;
    }
#endif
}


/*
================
D_EndDirectRect
================
*/
void D_EndDirectRect (int x, int y, int width, int height)
{
#if 0 
    if (!screen) return;
    if (x < 0) x = screen->w+x-1;
    /* SDL_UpdateRect(screen, x, y, width, height); */
#endif
}


/*
================
Sys_SendKeyEvents
================
*/

void Sys_SendKeyEvents(void)
{}

void IN_Init (void)
{
    if ( COM_CheckParm ("-nomouse") )
        return;
    mouse_x = mouse_y = 0.0;
    mouse_avail = 1;
}

void IN_Shutdown (void)
{
    mouse_avail = 0;
}

void IN_Commands (void)
{}

void IN_Move (usercmd_t *cmd)
{
    if (!mouse_avail)
        return;
   
    mouse_x *= sensitivity.value;
    mouse_y *= sensitivity.value;
   
    if ( (in_strafe.state & 1) || (lookstrafe.value && (in_mlook.state & 1) ))
        cmd->sidemove += m_side.value * mouse_x;
    else
        cl.viewangles[YAW] -= m_yaw.value * mouse_x;
    if (in_mlook.state & 1)
        V_StopPitchDrift ();
   
    if ( (in_mlook.state & 1) && !(in_strafe.state & 1)) {
        cl.viewangles[PITCH] += m_pitch.value * mouse_y;
        if (cl.viewangles[PITCH] > 80)
            cl.viewangles[PITCH] = 80;
        if (cl.viewangles[PITCH] < -70)
            cl.viewangles[PITCH] = -70;
    } else {
        if ((in_strafe.state & 1) && noclip_anglehack)
            cmd->upmove -= m_forward.value * mouse_y;
        else
            cmd->forwardmove -= m_forward.value * mouse_y;
    }
    mouse_x = mouse_y = 0.0;
}

/*
================
Sys_ConsoleInput
================
*/
char *Sys_ConsoleInput (void)
{
    return 0;
}
