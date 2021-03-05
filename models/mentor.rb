class Mentor < Sequel::Model
    def load(params)
        self.first_name = params.fetch("first_name", "").strip
        self.surname = params.fetch("surname", "").strip
        self.industry = params.fetch("industry", "").strip
        self.company = params.fetch("company", "").strip
        self.email = params.fetch("email", "").strip
        self.password = params.fetch("password", "").strip
    end
end