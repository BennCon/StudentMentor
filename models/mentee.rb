class Mentee < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.course = params.fetch("course", "").strip
        self.gender = params.fetch("gender", "").strip
        self.year_of_study = params.fetch("year_of_study", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
   
   def load_edit(params)
      self.first_name = params.fetch("first_name", "").strip
      self.surname = params.fetch("surname", "").strip
      self.year_of_study = params.fetch("year_of_study", "").strip
      self.biography = params.fetch("biography", "").strip
      self.email = params.fetch("email", "").strip
   end
    
    def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false if Mentee[id].nil? # check the database has a record with this id

        true # all checks are ok - the id exists
    end
    
    def get_id
        this_mentee = Mentee.first(email:email)
        return this_mentee.id
    end
end