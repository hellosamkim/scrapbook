require_relative "contact"
require_relative "rolodex"

class CRM
  def initialize
    system "clear"
    @rolodex = Rolodex.new
  end

  def self.run
    crm = CRM.new
    crm.main_menu
  end
	def print_main_menu
    puts "------------C R M-------------"
	  puts "(1) Add a new contact"
	  puts "(2) Display all the contacts"
	  puts "(3) Display an attribute"
	  puts "(4) Exit"
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
      display_contacts
    when 3
      display_by_attribute
    when 4
      system "clear"
      puts "------------------------------"
      puts "Thanks for using--------------"
      puts "-------------CRM App----------"
      puts "-------------------by Sam Kim-"
      puts "------------------------------"
    else
      puts "Please input a valid selection"
      clear_screen
      main_menu
    end
  end

  def clear_screen
    sleep 1.1
    system "clear"
  end

  def add_new_contact
    system "clear"
    print "Please enter your First Name: "
    first_name = gets.chomp.capitalize!
    print "Please enter your Last Name: "
    last_name = gets.chomp.capitalize!
    print "Please enter your E-Mail: "
    email = gets.chomp
    print "Please enter your Social Media Account (@example): "
    social_media = gets.chomp

    contact = Contact.new(first_name, last_name, email, social_media)
    @rolodex.add_contact(contact)
    clear_screen
    main_menu
  end

  def display_contacts
    x = 1
    system "clear"
    puts "Contact List"

    @rolodex.contacts.each do |contact|
      puts "(ID ##{contact.id})  Name: #{contact.first_name} #{contact.last_name}" 
      puts "         E-mail: #{contact.email}" 
      puts "         Social Media: #{contact.social_media}"
      puts
      x += 1
    end
    contact_options
  end

  def modify_contact(id)
    @rolodex.modify_contact(id)
    clear_screen
    main_menu
  end

  def delete_contact(id)
    @rolodex.delete_contact(id)
    clear_screen
    main_menu
  end

  def display_by_attribute
    system "clear"
    puts "Search Contact"
    puts "Search Options: (1) First Name, (2) Last Name, (3) Email, (4) Social Media"
    puts "To Return to Main Menu, type: main menu"
    print "Search (ex: 1, Sam // 3, sam@kim.com): "
    input = gets.chomp.downcase
    puts "-------------------------------"
    search_options = input.split(", ")
    @rolodex.display_by_attribute(search_options[0], search_options[1])
    contact_options
  end

  def contact_options
    puts "-----------------------------------------------"
    puts "Options Available:  Modify | Delete | Main Menu"
    print "Please Choose Contact ID and Option (ex: 1 modify // main menu): "
    options = gets.chomp.downcase
    option = options.split(" ")
    if option[1] == "modify"
      modify_contact(option[0].to_i)
    elsif option[1] == "delete"
      delete_contact(option[0].to_i)
    else
      puts "Returning to Main Menu..."
      clear_screen
      main_menu
    end
  end
end

CRM.run