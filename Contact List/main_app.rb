require 'sinatra'
require_relative 'contact'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = []
  @contacts << Contact.new("Sam", "Kim", "SamKim@gmail.com", "Phone Number")
  @contacts << Contact.new("Sfam", "Kimqwf", "SamKim@gmail.com", "Phone Number")
  @contacts << Contact.new("Saqwfm", "Kiqgqgm", "SamKim@gmail.com", "Phone Number")
  @contacts << Contact.new("Saqwem", "Kiewtwm", "SamKim@gmail.com", "Phone Number")

  erb :contacts
end