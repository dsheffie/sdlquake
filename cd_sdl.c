/*
  Some of this may not work. I'm not overly familiar with SDL, I just sort
  of podged this together from the SDL headers, and the other cd-rom code.

  Mark Baker <homer1@together.net>
*/


#include "quakedef.h"

static qboolean cdValid = false;
static qboolean initialized = false;
static qboolean enabled = true;
static qboolean playLooping = false;

static void CD_f();

static void CDAudio_Eject()
{
}

void CDAudio_Play(byte track, qboolean looping)
{

}


void CDAudio_Stop()
{

}

void CDAudio_Pause()
{

}


void CDAudio_Resume()
{

}

void CDAudio_Update()
{

}

int CDAudio_Init()
{

	return 0;
}


void CDAudio_Shutdown()
{
}

