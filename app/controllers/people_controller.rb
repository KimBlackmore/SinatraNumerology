get '/people' do
	@people = Person.all
	puts "go to people list"
	erb :"/people/index" 
end

get '/people/new'  do
	@person = Person.new
	erb :"/people/new"
end

post '/people'  do
	puts "************#{params[:birthdate]}%%%%%%%%%%%%%%%"
	if params[:birthdate]==nil
		@error = "You should enter a valid birthdate in the form dd/mm/yyyy."
		redirect '/people'
		return
	elsif params[:birthdate].include?("-")
		birthdate = params[:birthdate]
	else
		birthdate = Date.strptime(params[:birthdate],"%m%d%Y")		
	end
	person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
	puts " \n created person #{person.id}"
	redirect "/people/#{person.id}"
end

get '/people/:id' do
	@person = Person.find(params[:id])
	@birthdate_to_print = @person.birthdate.strftime("%d-%m-%Y")
	birthdate_string = @person.birthdate.strftime("%m%d%Y")
	@number = Person.get_birth_path_num(birthdate_string)
	@message = Person.get_message(@number)
	erb :"/people/show"
end

get '/people/:id/edit' do
	@person = Person.find(params[:id])
	@birthdate_to_default = @person.birthdate.strftime("%Y-%m-%d")
	erb :"/people/edit"
end


put '/people/:id' do
	person = Person.find(params[:id])
	person.first_name = params[:first_name]
	person.last_name = params[:last_name]
	person.birthdate = params[:birthdate]
	person.save
	redirect "/people/#{person.id}" 
end

delete '/people/:id' do
	person = Person.find(params[:id])
	person.destroy
    redirect "/people"
 end