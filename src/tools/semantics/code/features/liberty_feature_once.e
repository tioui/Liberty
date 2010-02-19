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
class LIBERTY_FEATURE_ONCE

inherit
	LIBERTY_FEATURE_ROUTINE

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	debug_display (o: OUTPUT_STREAM; tab: INTEGER) is
		do
			tabulate(o, tab)
			o.put_line(once "once...")
		end

	accept (v: VISITOR) is
		local
			v0: LIBERTY_FEATURE_ONCE_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_feature_once(Current)
		end

feature {LIBERTY_FEATURE_DEFINITION}
	join (a_feature: LIBERTY_FEATURE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			Result := a_feature.joined_once(Current, other_fd, current_fd)
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_feature: LIBERTY_FEATURE_ATTRIBUTE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(other_fd)
		end

	joined_constant (a_feature: LIBERTY_FEATURE_CONSTANT; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(other_fd)
		end

	joined_deferred (a_feature: LIBERTY_FEATURE_DEFERRED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			Result := Current
		end

	joined_do (a_feature: LIBERTY_FEATURE_DO; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(other_fd)
		end

	joined_external (a_feature: LIBERTY_FEATURE_EXTERNAL; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(other_fd)
		end

	joined_once (a_feature: LIBERTY_FEATURE_ONCE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(other_fd)
		end

	joined_redefined (a_feature: LIBERTY_FEATURE_REDEFINED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			if a_feature.definition_type = definition_type then
				current_fd.fatal_join_error_concrete_redefined(other_fd)
			end
			Result := Current
		end

	joined_unique (a_feature: LIBERTY_FEATURE_UNIQUE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(other_fd)
		end

end