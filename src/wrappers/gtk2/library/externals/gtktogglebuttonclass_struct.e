-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEBUTTONCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktogglebuttonclass_struct_set_toggled (a_structure: POINTER; a_value: POINTER) is
			-- Setter for toggled field of GTKTOGGLEBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebuttonclass_struct_set_toggled"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtktogglebuttonclass_struct_get_toggled (a_structure: POINTER): POINTER is
			-- Query for toggled field of GTKTOGGLEBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktogglebuttonclass_struct_get_toggled"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToggleButtonClass"
		}"
		end

end -- class GTKTOGGLEBUTTONCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

