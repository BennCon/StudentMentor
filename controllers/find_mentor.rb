get "/find-mentor" do
#   redirect "/index" unless session[:logged_in]
   id = session[:id]
   @mentee = Mentee[id] if Mentee.id_exists?(id)
   @user = User[id]
   @dataset = DB[:mentors] 

   @gender = params.fetch("gender", "").strip
   @industry = params.fetch("industry", "").strip
   @degree = params.fetch("degree_field", "").strip
   @sheff_grad = params.fetch("sheffield_graduate", "").strip
    
   @mentors = if @gender.empty? && @industry.empty? && @degree.empty? && @sheff_grad.empty?
                DB[:mentors]
              else
                Mentor.where(Sequel.like(:gender, "%#{@gender}%") && Sequel.like(:industry, "%#{@industry}%") && Sequel.like(:degree_field, "%#{@degree}%") && Sequel.like(:sheffield_graduate, "%#{@sheff_grad}%")) 
              end

  erb :find_mentor
end