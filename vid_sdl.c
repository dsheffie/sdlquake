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



uint32_t update_crc(uint32_t crc, uint8_t *buf, size_t len) {
  uint32_t c = crc;
  size_t n;
  int k;
  static const uint32_t POLY = 0x82f63b78;
  for(n=0;n<len;n++) {
    uint8_t b = buf[n];
    c ^= b;
    for(k = 0; k < 8; k++) {
      c = c & 1 ? (c>>1) ^ POLY : c>>1;
    }
  }
  return c;
}

uint32_t crc32(uint8_t *buf, size_t len) {
  return update_crc(~0x0, buf, len) ^ (~0x0);
}

typedef struct color16 {
  uint16_t b : 5;
  uint16_t g : 6;
  uint16_t r : 5;
} color16_t;

color16_t palette_[256];
static color16_t *fb = NULL;

void    VID_SetPalette (unsigned char *palette)
{
  int i;
  for ( i=0; i<256; ++i )
    {
      palette_[i].r = (*palette++) / 8;
      palette_[i].g = (*palette++) / 4;
      palette_[i].b = (*palette++) / 8;
    }
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
    uint8_t buffer[80];
    int i = 0;
    sprintf(buffer, "/proc/%d/maps", getpid());
    FILE *fp = fopen(buffer, "r");
    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
        printf("%s", buffer); // Print the line to the console
    }
    fclose(fp);

    
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

    VGA_pagebase = vid.buffer = malloc(vid.width*vid.height*sizeof(uint8_t));
    VGA_rowbytes = vid.rowbytes = vid.width*sizeof(uint8_t);

    fb = mmap_mem(vid.width*vid.height*sizeof(color16_t));
    
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


static inline uint64_t extract_byte(uint64_t u64, int b) {
  return (u64 >> (b * 8))& 0xff;
}

union pixel4x16bpp {
  struct {
    struct color16 p0;
    struct color16 p1;
    struct color16 p2;
    struct color16 p3;
  } packed;
  uint64_t u64;
};


void UpdateDisplayNow() {
  int i = 0;
  union pixel4x16bpp pA,pB;  
  for(i = 0; i < (vid.width*vid.height); i+=8) {
    uint64_t p8 = *(uint64_t*)(&VGA_pagebase[i]);
    pA.packed.p0 = palette_[extract_byte(p8, 0)];
    pA.packed.p1 = palette_[extract_byte(p8, 1)];
    pA.packed.p2 = palette_[extract_byte(p8, 2)];
    pA.packed.p3 = palette_[extract_byte(p8, 3)];    
    pB.packed.p0 = palette_[extract_byte(p8, 4)];
    pB.packed.p1 = palette_[extract_byte(p8, 5)];
    pB.packed.p2 = palette_[extract_byte(p8, 6)];
    pB.packed.p3 = palette_[extract_byte(p8, 7)];    
    *(uint64_t*)(&fb[i+0]) = pA.u64;
    *(uint64_t*)(&fb[i+4]) = pB.u64;    
    
    //fb[i] = palette_[VGA_pagebase[i]];
  }
  asm volatile ("fence.i" ::: "memory");
}

typedef struct {
  uint32_t f : 23;
  uint32_t e : 8;
  uint32_t s : 1;
} flt_t;

typedef union {
  float f;
  flt_t ff;
  uint32_t u32;
} floatint;

#include "fp32_recip.h"

#if 1
float __divsf3(float a, float b) {
  int r,e,n;
  floatint fia, fib;
  float y;
  fia.f = a;
  fib.f = b;
  n = (fib.ff.s);
  fib.ff.s = 0;
  float _b = fib.f;
#if 0
  /* should we round up? */
  r = (fib.ff.f>>22) & 3;
  /* unconditionally clear sign */
  e = r ? fib.ff.e+1 : fib.ff.e;
  /* clamp guess */
  y = recip_guess[e>256?256:e];
  /* do 4 newton raphson iterations */
#endif
  fib.u32 = 0x5f3759df - (fib.u32 >> 1);
  y = fib.f; /* ~ 1/sqrt(x) */
  y *= y; /* ~ 1/x */

  y = y * (2.0f - (_b*y));
   y = y * (2.0f - (_b*y)); 
  /* y = y * (2.0f - (_b*y));  */
  /* y = y * (2.0f - (_b*y));  */
  
  if(n) {
    y = -y;
  }
  y *= a;
  return y;
}
#endif




/*
================
Sys_ConsoleInput
================
*/
char *Sys_ConsoleInput (void)
{
    return 0;
}
