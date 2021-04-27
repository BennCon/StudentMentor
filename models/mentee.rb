class Mentee < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.username = params.fetch("username", "").strip
        self.course = params.fetch("course", "").strip
        self.gender = params.fetch("gender", "").strip
        self.year_of_study = params.fetch("year_of_study", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
   
   #Different param set for editing after sign-up
   def load_edit(params)
      self.first_name = params.fetch("first_name", "").strip
      self.surname = params.fetch("surname", "").strip
      self.username = params.fetch("username", "").strip
      self.year_of_study = params.fetch("year_of_study", "").strip
      self.biography = params.fetch("biography", "").strip
      self.course = params.fetch("course", "").strip
      self.email = params.fetch("email", "").strip
   end
    
   def validate
      super
      errors.add("first_name", "cannot be empty") if !first_name || first_name.empty?
      errors.add("surname", "cannot be empty") if !surname || surname.empty?
      errors.add("username", "cannot be empty") if !username || username.empty?
      errors.add("course", "cannot be empty") if !course || course.empty?
      errors.add("email", "cannot be empty") if !email || email.empty?
      errors.add("password", "cannot be empty") if !password || password.empty?
      errors.add("password", "must contain at least 5 characters") if (password.length < 5)
      errors.add("email", "That email is alrady registered to another account") if Validation.email_reg?(email)
   end
   
    def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false if Mentee[id].nil? # check the database has a record with this id

        true # all checks are ok - the id exists
    end
   
    
    def get_id
        this_mentee = Mentee.first(username:username)
        return this_mentee.id
    end
end