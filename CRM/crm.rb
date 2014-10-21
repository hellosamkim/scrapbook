require_relative "contact"
require_relative "rolodex"

class CRM
  def initialize
    system "clear"
  end

	def print_main_menu
    puts "------------C R M-------------"
	  puts "(1) Add a new contact"
	  puts "(2) Modify an existing contact"
	  puts "(3) Delete a contact"
	  puts "(4) Display all the contacts"
	  puts "(5) Display an attribute"
	  puts "(6) Exit"
	  print "Please pick your selection: "
    @selection = gets.chomp.to_i
	end

	def main_menu
		print_main_menu
    call_option(@selection)
	end

  def call_option(input)
    case selection
    when 1
      add_new_contact
    when 2
      modify_contact
    when 3
      delete_contact
    when 4
      display_contacts
    when 5
      display_by_attribute
    when 6
      puts "Thankss for Using."
      puts "Made by Sam Kim"
      puts "From Toronto with <3"
    else
      system "clear"
      puts "Please input a valid selection"
      main_menu
    end
  end
end
crm = CRM.new
crm.main_menu