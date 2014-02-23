class EDC_DUMMY_SESSION_FETCH[E_]

inherit
   EDC_SESSION_FETCH[E_]

create {EDC_DUMMY_SESSION}
   make

feature {EDC_FIELD}
   item (record: EDC_RECORD; field: EDC_FIELD[E_]): E_ is
      do
         Result := dataset.reference_at(session.data(record).internal_id)
      end

   set (record: EDC_RECORD; field: EDC_FIELD[E_]; i: E_) is
      do
         dataset.fast_put(i, session.data(record).internal_id)
      end

feature {}
   make (a_session: like session) is
      require
         a_session /= Void
      do
         session := a_session
         create dataset.make
      ensure
         session = a_session
      end

   session: EDC_DUMMY_SESSION
   dataset: HASHED_DICTIONARY[E_, INTEGER_64]

invariant
   session /= Void
   dataset /= Void

end -- class EDC_DUMMY_SESSION_FETCH