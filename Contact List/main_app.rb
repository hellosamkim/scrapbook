require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new

get '/' do
  erb :index
end

get '/new' do
  erb :new_contact
end

post '/' do
  new_contact = Contact.new(params[:first_name].capitalize, params[:last_name].capitalize, params[:phone_number], params[:email], params[:social_media])
  @@rolodex.add_contact(new_contact)
  redirect to('/')
end