class Mentor < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.username = params.fetch("username", "").strip
        self.gender = params.fetch("gender", "").strip
        self.industry = params.fetch("industry", "").strip
        self.company = params.fetch("company", "").strip
        self.sheffield_graduate = params.fetch("sheffield_graduate", "").strip
        self.degree_field = params.fetch("degree_field", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
   
   #Different param set for editing after sign-up
    def load_edit(params)
       self.email = params.fetch("email", "").strip
       self.first_name = params.fetch("first_name", "").strip
       self.surname = params.fetch("surname", "").strip
       self.username = params.fetch("username", "").strip
       self.industry = params.fetch("industry", "").strip
       self.company = params.fetch("company", "").strip
       self.biography = params.fetch("biography", "").strip
    end
   
   def validate
      super
      errors.add("first_name", "cannot be empty") if !first_name || first_name.empty?
      errors.add("first_name", "cannot contain a number") if Validation.contains_number?(first_name)
      errors.add("surname", "cannot be empty") if !surname || surname.empty?
      errors.add("surname", "cannot contain a number") if Validation.contains_number?(surname)
      errors.add("username", "cannot be empty") if !username || username.empty?
      errors.add("company", "cannot be empty") if !company || company.empty?
      errors.add("email", "cannot be empty") if !email || email.empty?
      errors.add("password", "cannot be empty") if !password || password.empty?
      errors.add("password", "must contain at least 5 characters") if (password.length < 5)
      errors.add("email", "is alrady registered to another account") if Validation.email_reg?(email)
      errors.add("username", "is already registered to another account") if Validation.username_reg?(username)
   end
       
    
    def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false if Mentor[id].nil? # check the database has a record with this id

        true # all checks are ok - the id exists
    end
    
    def get_id
       this_mentor = Mentor.first(username:username)
       return this_mentor.id
    end
end