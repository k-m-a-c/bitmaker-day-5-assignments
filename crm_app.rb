# done=
#   * -add contact
#   -modify contact
#   * -display all contacts
#   -display a contact attribute
#   -delete a contact

require_relative('rolodex.rb')

class CRM
  attr_accessor :name

  def self.run(name)
    best_crm_ever = CRM.new(name)
    best_crm_ever.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def show_main_menu
    puts "[1] Add a contact"
    puts "[2] Modfiy a contact"
    puts "[3] Display all contacts"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] Exit menu"
  end

  def choose_menu_option(main_menu_choice)
    case main_menu_choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_contacts
    when 4 then display_attribute
    when 5 then delete_contact
    when 6 then exit
    else puts "Sorry, I'm afraid I can't do that."
    end
  end

  def main_menu
    puts "Welcome to #{@name}!"
    puts "\n"

    while true
      show_main_menu
      puts "\n"
      print "Select an option:"
      main_menu_choice = gets.chomp.to_i

      return if main_menu_choice == 6

      choose_menu_option(main_menu_choice)
    end
  end

  def add_contact
    puts "Adding a damn fine contact."
    print "First Name: "
    first_name = gets.chomp

    print "Last Name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def edit_contact
    display_contacts
    print "Type in the email of the contact you want to edit:"
    @rolodex.index(@email)
  end

  def contact_menu

  end

  def display_contacts
    puts "Here are yo' contacts mo'fucka."
    @rolodex.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name}"
      puts "#{contact.email}"
      puts "#{contact.notes}"
    end
  end

  def display_attribute
    puts "Here's a sweet attribute of yo' contact"
  end

  def delete_contact
    puts "She gon'!"
  end

  def exit
  end

end

CRM.run("Kevin's BAMF CRM")