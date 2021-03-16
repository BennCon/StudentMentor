class Mentor < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.gender = params.fetch("gender", "").strip
        self.industry = params.fetch("industry", "").strip
        self.company = params.fetch("company", "").strip
        self.sheffield_graduate = params.fetch("sheffield_graduate", "").strip
        self.degree_field = params.fetch("degree_field", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
    
    def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false if Mentor[id].nil? # check the database has a record with this id

        true # all checks are ok - the id exists
    end
    
    def get_id
       this_mentor = Mentor.first(email:email)
       return this_mentor.id
    end
end