class Contact
  attr_accessor :id, :first_name, :last_name, :email, :social_media

  def initialize(first_name, last_name, email, social_media)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @social_media = social_media
    @id = id
  end
end