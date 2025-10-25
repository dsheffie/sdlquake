OBJ = cd_sdl.o chase.o cl_demo.o cl_input.o cl_main.o cl_parse.o cl_tent.o cmd.o common.o console.o crc.o cvar.o\
    d_edge.o d_fill.o d_init.o d_modech.o d_part.o d_polyse.o draw.o d_scan.o d_sky.o d_sprite.o d_surf.o d_vars.o\
    d_zpoint.o host_cmd.o host.o keys.o mathlib.o menu.o model.o net_bsd.o net_dgrm.o net_loop.o net_main.o net_udp.o\
    net_vcr.o net_wso.o nonintel.o pr_cmds.o pr_edict.o pr_exec.o r_aclip.o r_alias.o r_bsp.o r_draw.o r_edge.o r_efrag.o\
    r_light.o r_main.o r_misc.o r_part.o r_sky.o r_sprite.o r_surf.o r_vars.o sbar.o screen.o snd_dma.o snd_mem.o snd_mix.o\
    snd_sdl.o sv_main.o sv_move.o sv_phys.o sv_user.o sys_sdl.o vid_sdl.o view.o wad.o world.o zone.o va2pa.o

#divsf3.o

EXE = sdlquake
DEP = $(OBJ:.o=.d)

ISA = -march=rv64ima_zicond_zba_zbb_zifencei 
CFLAGS = -g -O3 $(ISA) -DSDL -fno-strict-aliasing -MMD -std=gnu89 -flto
CC = /home/dsheffie/code/riscv-llvm/_build2/bin/clang --target=riscv64-buildroot-linux-gnu
GCC = /home/dsheffie/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-gcc
OD = /home/dsheffie/code/riscv-llvm/_build2/bin/llvm-objdump
LFLAGS = -static

all: $(OBJ)
	$(CC) $(CFLAGS) $(LFLAGS) $(OBJ) -o $(EXE) -lm -z max-page-size=65536
	$(OD) -ldw $(EXE) &> $(EXE).disasm

va2pa.o : va2pa.c
	$(GCC) $(ISA) -O2 -c $<

#divsf3.o : divsf3.s
#	$(CC) $(ISA) -c $<

%.o : %.c
	$(CC) $(CFLAGS) -c $<

-include $(DEP)

clean:
	rm -rf $(EXE) $(OBJ)
