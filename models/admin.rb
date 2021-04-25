class Admin < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.username = params.fetch("username", "").strip
        self.admin_code = params.fetch("admin_code", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
   
    #Different param set for editing after sign-up
    def load_edit(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.username = params.fetch("username", "").strip
        self.email = params.fetch("email", "").strip
    end

   def validate
      super
      errors.add("first_name", "cannot be empty") if !first_name || first_name.empty?
      errors.add("surname", "cannot be empty") if !surname || surname.empty?
      errors.add("username", "cannot be empty") if !username || username.empty?
      errors.add("email", "cannot be empty") if !email || email.empty?
      errors.add("password", "cannot be empty") if !password || password.empty?
      errors.add("password", "must contain at least 5 characters") if (password.length < 5)
#       return unless Validation.email_reg?(email)
#       errors.add("email", "already reg")
   end
   
    def get_id
        this_admin = Admin.first(username:username)
        return this_admin.id
    end
   
    #Method for checking admin code 
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
    
end