require_relative "contact"
require_relative "rolodex"

class CRM
  def initialize
    system "clear"
    @rolodex = Rolodex.new
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
    case input
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
      system "clear"
      puts "------------------------------"
      puts "Thanks for using--------------"
      puts "-------------CRM App----------"
      puts "-------------------by Sam Kim-"
      puts "------------------------------"
    else
      puts "Please input a valid selection"
      clear_screen
    end
  end

  def clear_screen
    sleep 1.3
    system "clear"
    main_menu
  end

  def add_new_contact
    system "clear"
    print "Please enter your First Name: "
    first_name = gets.chomp
    print "Please enter your Last Name: "
    last_name = gets.chomp
    print "Please enter your E-Mail: "
    email = gets.chomp
    print "Please enter your Social Media Account: "
    social_media = gets.chomp

    contact = Contact.new(first_name, last_name, email, social_media)
    @rolodex.add_contact(contact)
    puts "Contact has successfully been added."
    clear_screen
  end

end
crm = CRM.new
crm.main_menu