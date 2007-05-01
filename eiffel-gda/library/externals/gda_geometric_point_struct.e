indexing
	description: "Access to GdaGeometricPoint C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_GEOMETRIC_POINT_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls

--   GdaGeometricPoint

--  typedef struct {
--          gdouble x;
--          gdouble y;
--  } GdaGeometricPoint;
--   GdaGeometricPoint

--  typedef struct {
--          gdouble x;
	get_x (a_struct: POINTER): REAL is
		external "C struct GdaGeometricPoint get x use <libgda/libgda.h>"
		end

	set_x (a_struct: POINTER; a_x: REAL) is
		external "C struct GdaGeometricPoint set x use <libgda/libgda.h>"
		end
--          gdouble y;

	get_y (a_struct: POINTER): REAL is
		external "C struct GdaGeometricPoint get y use <libgda/libgda.h>"
		end

	set_y (a_struct: POINTER; a_y: REAL) is
		external "C struct GdaGeometricPoint set y use <libgda/libgda.h>"
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaGeometricPoint)"
		end

end
