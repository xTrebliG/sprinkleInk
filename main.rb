require 'sinatra'
require 'mandrill'

get '/' do 
	@title = "Sprinkle Ink"
	erb :home
end

get '/signaturePens' do
	@title = "Signature Pens"
	erb :signaturePens
end

get '/contact' do
	@title = "Contact Us"
	erb :contact
end

post '/contact' do
	contact_name = params["name"]
	contact_email = params["email"]
	email_body = "Message recieved!"
	m = Mandrill::API.new
	message = {  
	 :subject=> "Thanks for your submission",  
	 :from_name=> "Jae",  
	 :text=> email_body,
	 :to=>[  
	   {  
	     :email=> contact_email, 
	     :name=> contact_name
	   }  
	 ],  
	 :html=>"<html><h1>Hi <strong>#{email_body}</strong></h1></html>",  
	 :from_email=>"jae.syoon19@gmail.com"  
	}  
	sending = m.messages.send message  
	puts sending
	redirect to('/thanks')

end

get '/thanks' do
	erb :thanks
end

get '/aboutus' do 
	@title = "About Us"
	erb :aboutus
end