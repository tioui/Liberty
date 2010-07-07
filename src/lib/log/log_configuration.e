-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class LOG_CONFIGURATION
--
-- To configure the logging framework.
--

feature {ANY}
	load (a_stream: INPUT_STREAM; when_error: PROCEDURE[TUPLE[STRING]]; path_resolver: FUNCTION[TUPLE[STRING], STRING]) is
		require
			a_stream.is_connected
		do
			internal.load(a_stream, when_error, path_resolver)
		end

feature {LOGGING}
	logger (a_tag: FIXED_STRING): LOGGER is
		require
			a_tag /= Void
		do
			Result := internal.conf_logger(a_tag)
		ensure
			Result /= Void
		end

feature {LOGGER}
	generation_id: INTEGER is
		do
			Result := internal.generation_id
		end

feature {}
	internal: LOG_INTERNAL_CONF is
		once
			create Result.make
		end

end