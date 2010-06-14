-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TIMESPEC_STRUCT

inherit ANY undefine is_equal, copy end

insert STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

	timespec_struct_set_tv_sec (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for tv_sec field of TIMESPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timespec_struct_set_tv_sec"
		}"
		end

	timespec_struct_set_tv_nsec (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for tv_nsec field of TIMESPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timespec_struct_set_tv_nsec"
		}"
		end

feature {} -- Low-level queries

	timespec_struct_get_tv_sec (a_structure: POINTER): INTEGER_64 is
			-- Query for tv_sec field of TIMESPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timespec_struct_get_tv_sec"
		}"
		end

	timespec_struct_get_tv_nsec (a_structure: POINTER): INTEGER_64 is
			-- Query for tv_nsec field of TIMESPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timespec_struct_get_tv_nsec"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_timespec"
		}"
		end

end -- class TIMESPEC_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
