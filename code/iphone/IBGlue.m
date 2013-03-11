/*
 =======================================================================================
 
 Copyright (C) 2009-2011 id Software LLC, a ZeniMax Media company.  All Right Reserved.
 
 This file is part of the DOOM Classic iOS v2.1 GPL Source Code.
 
 =======================================================================================
 */



#include "IBGlue.h"
#import "DoomAppDelegate.h"
#include "doomiphone.h"

// Tells Interface Builder to go to the Main Menu.
void IB_GotoMainMenu()
{
    DoomAppDelegate* delegate = (DoomAppDelegate*) [[UIApplication sharedApplication] delegate];
    [delegate.controller switchToMenu: main_menu];
}
