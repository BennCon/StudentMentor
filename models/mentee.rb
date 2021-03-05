class Mentee < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.course = params.fetch("course", "").strip
        self.year_of_study = params.fetch("year_of_study", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
end