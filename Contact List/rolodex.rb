class Rolodex
  attr_accessor :id, :first_name, :last_name, :email, :social_media, :phone_number

  def initialize
    @contacts = []
    @id = 1
  end

  def contacts
    @contacts
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end
end