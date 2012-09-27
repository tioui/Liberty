-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_TYPED_BRIDGE_APPLICATION[J_ -> UI_JOB,
                                           W_ -> UI_TYPED_BRIDGE_WINDOW[J_,
                                                                        UI_TYPED_BRIDGE_PANEL[J_, UI_TYPED_BRIDGE_WIDGET[J_]],
                                                                        UI_TYPED_BRIDGE_MENU[J_, UI_TYPED_BRIDGE_MENU_ITEM[J_]]]]

inherit
   UI_BRIDGE_APPLICATION
   UI_TYPED_BRIDGE_COLLECTION[J_, W_]

feature {UI_APPLICATION}
   add (a_window: W_) is
      deferred
      end

end -- class UI_TYPED_BRIDGE_APPLICATION
--
-- Copyright (c) 2012 Cyril ADRIAN <cyril.adrian@gmail.com>.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
