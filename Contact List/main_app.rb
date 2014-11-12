require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:contacts.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :phone_number, String
  property :social_media. String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  erb :index
end

get '/new' do
  erb :new_contact
end

post '/' do
  new_contact = Contact.new(params[:first_name].capitalize, params[:last_name].capitalize, params[:phone_number], params[:email], params[:social_media])
  @@rolodex.add_contact(new_contact)
  puts params
  redirect to('/')
end