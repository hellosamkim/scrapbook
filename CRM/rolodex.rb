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
	end
end