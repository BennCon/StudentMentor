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
end