require_relative './app'

@response = App.new

def menu_options
  print 'Welcome to my Library! You may perform the following tasks:

    1. List all books.

    2. List all people

    3. Create a person

    4. Create a book.

    5. Create a rental

    6. List all rentals for a given person id.

    7. Exit

    Choose (1-7): '
end

def user_choice
  gets.chomp.to_i
end

def match_input(choice)
  case choice

  when 1

    @response.list_books

  when 2

    @response.list_people

  when 3

    @response.create_person

  when 4

    @response.create_book

  when 5

    @response.create_rental

  when 6

    @response.list_all_rentals_id

  when 7

    @response.quit_app

  else

    puts 'Not a valid choice'

  end
end

def main(status)
  loop do
    break unless status

    menu_options

    user_input = user_choice

    match_input(user_input)
  end
end

main(true)
