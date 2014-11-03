require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new

get '/' do
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end