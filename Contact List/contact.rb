class Contact
  attr_accessor :id, :first_name, :last_name, :email, :social_media, :phone_number

  def initialize(first_name, last_name, phone_number, email, social_media)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @social_media = social_media
    @phone_number = phone_number
    @id = id
  end
end