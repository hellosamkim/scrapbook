class Rolodex
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
    puts "Contact has successfully been added."
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
end