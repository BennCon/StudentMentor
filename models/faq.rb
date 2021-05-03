class Questions_answers < Sequel::Model
    def load(params)
        self.question = params.fetch("question", "").strip
        self.answer = params.fetch("answer", "").strip
        self.user_type = params.fetch("user_type", "").strip
    end
end