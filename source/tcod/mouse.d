/*
* libtcod 1.5.1
* Copyright (c) 2008,2009,2010,2012 Jice & Mingos
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * The name of Jice or Mingos may not be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY JICE AND MINGOS ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL JICE OR MINGOS BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

module tcod.mouse;

import tcod.c.functions;
import tcod.c.types;

/**
 Mouse support
 */
class TCODMouse {
public :
    /**
    Display and hide the mouse cursor

    By default, the mouse cursor in visible in windowed mode, hidden in
    fullscreen mode.

    Params:
        visible = If true, this function turns the mouse cursor on. Else it
                  turns the mouse cursor off.
    */
    static void showCursor(bool visible) {
        TCOD_mouse_show_cursor(visible);
    }

    /**
    Get the current cursor status (hidden or visible).
    */
    static bool isCursorVisible() {
        return TCOD_mouse_is_cursor_visible() != 0;
    }

    /**
    Setting the mouse cursor's position (in pixel coordinates, where [0,0] is
    the window's top left corner)

    Params:
        x = New x coordinate of the mouse cursor in pixels.
        y = New y coordinate of the mouse cursor in pixels.
    */
    static void move(int x, int y) {
        TCOD_mouse_move(x, y);
    }

    /**
    Getting the mouse status

    You can read the current mouse status with this function. Note that this
    function does not update the mouse status. You have to call either
    TCODSystem.checkForEvent or TCODSystem.waitForEvent for the mouse status
    to be updated.
<div class="code"><pre>typedef struct {
  int x,y;
  int dx,dy;
  int cx,cy;
  int dcx,dcy;
  bool lbutton;
  bool rbutton;
  bool mbutton;
  bool lbutton_pressed;
  bool rbutton_pressed;
  bool mbutton_pressed;
  bool wheel_up;
  bool wheel_down;
} TCOD_mouse_t;
</pre></div>

    Params:
        x = Absolute x position of the mouse cursor in pixels relative to the
            window top-left corner.
        y = Absolute y position of the mouse cursor in pixels relative to the
            window top-left corner.
        dx = x Movement of the mouse cursor since the last call in pixels.
        dy = y Movement of the mouse cursor since the last call in pixels.
        cx = x coordinate of the console cell under the mouse cursor (pixel
               coordinate divided by the font size).
        cy = y coordinate of the console cell under the mouse cursor (pixel
               coordinate divided by the font size).
        dcx = x movement of the mouse since the last call in console cells
              (pixel coordinates divided by the font size).
        dcy    = y movement of the mouse since the last call in console cells
              (pixel coordinates divided by the font size).
        lbutton    = true if the left button is pressed.
        rbutton    = true if the right button is pressed.
        mbutton    = true if the middle button (or the wheel) is pressed.
        lbutton_pressed    = true if the left button was pressed and released.
        rbutton_pressed    = true if the right button was pressed and released.
        mbutton_pressed    = true if the middle button was pressed and released.
        wheel_up = true if the wheel was rolled up.
        wheel_down = true if the wheel was rolled down.
    */
    static TCOD_mouse_t getStatus() {
        return TCOD_mouse_get_status();
    }
}
