-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REVERSE_VON_NEUMAN1

create {}
   make

feature {}
   make
      local
         tab: ARRAY[INTEGER]; s: REVERSE_COLLECTION_SORTER[INTEGER]
      do
         tab := {ARRAY[INTEGER] 1, << 3, 1, 2, 3, 5, 9 >> }
         s.von_neuman_sort(tab)
         assert(tab.is_equal({ARRAY[INTEGER] 1, << 9, 5, 3, 3, 2, 1 >> }), tab)
         tab.add_last(4)
         s.von_neuman_sort(tab)
         assert(tab.is_equal({ARRAY[INTEGER] 1, << 9, 5, 4, 3, 3, 2, 1 >> }), tab)
      end

   assert (b: BOOLEAN; tab: ARRAY[INTEGER])
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_REVERSE_VON_NEUMAN1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_REVERSE_VON_NEUMAN1
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
