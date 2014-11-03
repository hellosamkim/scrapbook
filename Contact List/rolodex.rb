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

  def modify_contact(id)
    @contacts.each do |contact|
      if contact.id == id
        print "You sure u want to change the contact, #{contact.first_name} #{contact.last_name}? (Y/N): "
        input = gets.chomp.upcase
        if input == "Y"
          print "Please enter New First Name: "
          first_name = gets.chomp.capitalize!
          print "Please enter New Last Name: "
          last_name = gets.chomp.capitalize!
          print "Please enter New E-Mail: "
          email = gets.chomp
          print "Please enter New Social Media Account (@example): "
          social_media = gets.chomp

          contact.first_name = first_name
          contact.last_name = last_name
          contact.email = email
          contact.social_media = social_media
          puts "Contact has successfully been modified"
        end
      end
    end
  end

  def delete_contact(id)
    @contacts.delete_if {|contact| contact.id == id}
    puts "Contact has successfully been deleted"
  end

  def display_by_attribute(attr, search)
    system "clear"
    puts "Your Results for #{search}"
    search.capitalize!
    case attr.to_i
    when 1
      @contacts.each do |contact|
        if contact.first_name == search
          display_contact(contact.id, contact.first_name, contact.last_name, contact.email, contact.social_media)
        end
      end

    when 2
      @contacts.each do |contact|
        if contact.last_name == search
          display_contact(contact.id, contact.first_name, contact.last_name, contact.email, contact.social_media)
        end
      end

    when 3
      @contacts.each do |contact|
        if contact.email == search
          display_contact(contact.id, contact.first_name, contact.last_name, contact.email, contact.social_media)
        end
      end

    when 4
      @contacts.each do |contact|
        if contact.social_media == search
          display_contact(contact.id, contact.first_name, contact.last_name, contact.email, contact.social_media)
        end
      end
    end
  end

  def display_contact(id, fname, lname, email, sm)
    puts "(ID ##{id})  Name: #{fname} #{lname}" 
    puts "       E-mail: #{email}" 
    puts "   Social Media: #{sm}"
    puts
  end
end