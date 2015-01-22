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

get '/aboutus' do 
	@title = "About Us"
	erb :aboutus
end