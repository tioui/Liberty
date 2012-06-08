-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_AST_IF
   --
   -- This class handles both "if" and "elseif" hence the redefines
   --

inherit
   LIBERTY_AST_NON_TERMINAL_NODE
      redefine
         valid_name, make
      end

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   expression: LIBERTY_AST_EXPRESSION is
      do
         Result ::= nodes.item(1)
      end

   instructions: EIFFEL_LIST_NODE is
      do
         Result ::= nodes.item(3)
      end

feature {ANY}
   count: INTEGER is 4

   name: STRING

feature {}
   make (a_name: like eiffel_name; a_names: TRAVERSABLE[FIXED_STRING]) is
      do
         name := a_name.out
         Precursor(a_name, a_names)
      end

   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 4 >> }
      end

   valid_name (a_name: like eiffel_name): BOOLEAN is
      do
         inspect
            a_name
         when "If", "ElseIf" then
            Result := True
         else
            --Result := False
         end
      end

end