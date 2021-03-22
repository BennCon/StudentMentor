class Admin < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.admin_code = params.fetch("admin_code", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
   
    def load_edit(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.email = params.fetch("email", "").strip
    end
   
    def valid_code?(in_code)
      @codesTable = DB[:codes]
      match = false
      (@codesTable).each do |code|
         if ((in_code == code[:code]) && (code[:used] == 0))
            id = code[:id]
            @code = Code[id]
            @code.used = 1
            @code.save_changes
            match = true
            break
         end
      end
      return match
    end
       
    
    def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false if Admin[id].nil? # check the database has a record with this id

        true # all checks are ok - the id exists
    end
    
    def get_id
       this_admin = Admin.first(email:email)
       return this_admin.id
    end
end