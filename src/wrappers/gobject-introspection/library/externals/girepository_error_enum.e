-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIREPOSITORY_ERROR_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = library_not_found_low_level)  or else
				(a_value = namespace_mismatch_low_level)  or else
				(a_value = namespace_version_conflict_low_level)  or else
				(a_value = typelib_not_found_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_library_not_found is
		do
			value := library_not_found_low_level
		end

	set_namespace_mismatch is
		do
			value := namespace_mismatch_low_level
		end

	set_namespace_version_conflict is
		do
			value := namespace_version_conflict_low_level
		end

	set_typelib_not_found is
		do
			value := typelib_not_found_low_level
		end

feature {ANY} -- Queries
	is_library_not_found: BOOLEAN is
		do
			Result := (value=library_not_found_low_level)
		end

	is_namespace_mismatch: BOOLEAN is
		do
			Result := (value=namespace_mismatch_low_level)
		end

	is_namespace_version_conflict: BOOLEAN is
		do
			Result := (value=namespace_version_conflict_low_level)
		end

	is_typelib_not_found: BOOLEAN is
		do
			Result := (value=typelib_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	library_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND"
 			}"
 		end

	namespace_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH"
 			}"
 		end

	namespace_version_conflict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT"
 			}"
 		end

	typelib_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND"
 			}"
 		end


end -- class GIREPOSITORY_ERROR_ENUM