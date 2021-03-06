-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_BEFORE_EXIT2

inherit
   DISPOSABLE

create {ANY}
   make

feature {ANY}
   text_file_write: TEXT_FILE_WRITE

   make
      do
         create text_file_write.connect_to(once "before_exit.new")
      end

   counter: COUNTER
      once
         create Result
      end

   dispose
      do
         if counter.item = 0 then
            text_file_write.put_string("The before_exit run is ok.%N")
            text_file_write.put_string("This file must be kept unchanged under git control.%N")
         else
            text_file_write.put_string("ERROR *** in TEST_BEFORE_EXIT2 (counter = #(1))***%N" # counter.item.out)
         end
         counter.increment
         text_file_write.disconnect
      end

end -- class AUX_BEFORE_EXIT2
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
