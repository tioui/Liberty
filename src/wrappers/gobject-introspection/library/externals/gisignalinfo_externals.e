-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GISIGNALINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_signal_info_get_class_closure (an_info: POINTER): POINTER is
 		-- g_signal_info_get_class_closure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_info_get_class_closure"
		}"
		end

	g_signal_info_get_flags (an_info: POINTER): INTEGER is
 		-- g_signal_info_get_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_info_get_flags"
		}"
		end

	g_signal_info_true_stops_emit (an_info: POINTER): INTEGER is
 		-- g_signal_info_true_stops_emit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_info_true_stops_emit"
		}"
		end


end -- class GISIGNALINFO_EXTERNALS