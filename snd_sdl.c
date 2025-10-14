
#include <stdio.h>

#include "quakedef.h"

static dma_t the_shm;
static int snd_inited;

extern int desired_speed;
extern int desired_bits;



qboolean SNDDMA_Init(void)
{
  return 0;
}

int SNDDMA_GetDMAPos(void)
{
	return shm->samplepos;
}

void SNDDMA_Shutdown(void)
{
}

