get "/find-mentor" do
#   redirect "/index" unless session[:logged_in]
   id = session[:id]
   @mentee = Mentee[id] if Mentee.id_exists?(id)
   @user = User[id]

   filters = Hash.new
   filters["gender"] = params.fetch("gender", "").strip
   filters["industry"] = params.fetch("industry", "").strip
   filters["degree_field"] = params.fetch("degree_field", "").strip
   filters["sheffield_graduate"] = params.fetch("sheffield_graduate", "").strip
    
   @mentors = DB[:mentors]
   filters.each do |filter, value|
      @mentors = @mentors.where(Sequel.like(:"#{filter}", "#{value}%"))
   end

  erb :find_mentor
end