get '/' do
	erb :form
end

post '/' do 
	birthdate = params[:birthdate].gsub("-","")
	if Person.valid_birthdate(birthdate)
		number = Person.get_birth_path_num(birthdate)
		redirect "message/#{number}"
	else
		@error = "You should enter a valid birthdate in the form of mmddyyyy."
		erb :form
	end
end

get '/message/:birth_path_num' do
	@number = params[:birth_path_num].to_i
	@message = Person.get_message(@number)
	erb :index
end

get '/:birthdate' do
	setup_index_view
end

def setup_index_view
	birthdate = params[:birthdate]
	@number = Person.get_birth_path_num(birthdate)
	@message = Person.get_message(@number)
	erb :index	
end