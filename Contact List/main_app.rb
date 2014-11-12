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
  property :social_media, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/new' do
  erb :new_contact
end

post '/' do
  contact = Contact.create(
    :first_name => params[:first_name].capitalize!,
    :last_name => params[:last_name].capitalize!,
    :email => params[:email],
    :phone_number => params[:phone_number],
    :social_media => params[:social_media]
  )
  puts params
  redirect to('/')
end

get '/:id' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end