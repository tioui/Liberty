-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STANDARD_C_LIBRARY_TYPES


insert ANY undefine is_equal, copy end

feature {ANY} -- C type definitions (typedefs)
feature {ANY} -- variable-size types
	long: INTEGER_32
		-- a query with the same type of c 'long int'. useful when dealing with
		-- code that uses long int variable: just insert this class and mark
		-- the type as 'like long'
	do
		-- empty by design
	end

   long_unsigned: NATURAL_32
		-- a query with the same type of c 'long unsigned int'. useful when dealing with
		-- code that uses long int variable: just insert this class and mark
		-- the type as 'like long_unsigned'
	do
		-- empty by design
	end

feature {ANY} -- C type definitions (typedefs)
	uint64_t: like long_unsigned
		-- typedef uint64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_least8_t: CHARACTER
		-- typedef uint_least8_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	timer_t: POINTER
		-- typedef timer_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	comparison_fn_t: POINTER
		-- typedef comparison_fn_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_fast32_t: like long_unsigned
		-- typedef uint_fast32_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	off64_t: like long
		-- typedef off64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int8_t: CHARACTER
		-- typedef int8_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_least64_t: like long
		-- typedef int_least64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	intmax_t: like long
		-- typedef intmax_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_least16_t: NATURAL_16
		-- typedef uint_least16_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_fast8_t: CHARACTER
		-- typedef uint_fast8_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint16_t: NATURAL_16
		-- typedef uint16_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int32_t: INTEGER
		-- typedef int32_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int64_t: like long
		-- typedef int64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uintmax_t: like long_unsigned
		-- typedef uintmax_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	error_t: INTEGER
		-- typedef error_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	size_t: like long_unsigned
		-- typedef size_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ssize_t: like long
		-- typedef ssize_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uintptr_t: like long_unsigned
		-- typedef uintptr_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clock_t: like long
		-- typedef clock_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_least16_t: INTEGER_16
		-- typedef int_least16_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	time_t: like long
		-- typedef time_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_fast64_t: like long_unsigned
		-- typedef uint_fast64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ptrdiff_t: like long
		-- typedef ptrdiff_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_fast16_t: like long
		-- typedef int_fast16_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int16_t: INTEGER_16
		-- typedef int16_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint8_t: CHARACTER
		-- typedef uint8_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_fast8_t: CHARACTER
		-- typedef int_fast8_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_least32_t: NATURAL
		-- typedef uint_least32_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint32_t: NATURAL
		-- typedef uint32_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_fast16_t: like long_unsigned
		-- typedef uint_fast16_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_least32_t: INTEGER
		-- typedef int_least32_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_least8_t: CHARACTER
		-- typedef int_least8_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	off_t: like long
		-- typedef off_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_fast32_t: like long
		-- typedef int_fast32_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clockid_t: INTEGER
		-- typedef clockid_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	int_fast64_t: like long
		-- typedef int_fast64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	intptr_t: like long
		-- typedef intptr_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	uint_least64_t: like long_unsigned
		-- typedef uint_least64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
