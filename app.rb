require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
class App
  attr_accessor :people, :book, :rental

  def initialize()
    @people = []
    @books = []
    @book = nil
    @rentals = []
    @person = nil
  end

  # LIST ALL BOOKS METHOD
  def list_books
    puts 'There are no books found, Kindly add at least one book' if @books.empty?
    @books.each_with_index do |book, index|
      puts "(#{index + 1}) Book => Title: #{book.title}, Author: #{book.author}"
    end
  end

  # LIST ALL PEOPLES METHOD

  def list_people
    if @people.length.zero?
      puts 'You need at least one person'
    else
      @people.map.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # CREATE PERSON METHOD
  def create_person()
    puts 'Do you want to create a student(1) or a teacher(2)? [Enter a number 1 or 2]: '
    cartegory = gets.chomp.to_i
    case cartegory
    when 1
      puts 'Great! let\'s create the student!'
      print 'Student age: '
      stdage = gets.chomp.to_i
      print 'Student name: '
      stdname = gets.chomp
      print 'Student class: '
      std_class = gets.chomp
      print 'Parent permission? true/ false: '
      stdparpermission = gets.chomp
      case stdparpermission
      when 'true'
        @people.push(Student.new(stdage, std_class, stdname, true))
        puts 'Student is created successfully'
      when 'false'
        @people.push(Student.new(stdage, std_class, stdname, false))

        puts 'Student is created successfully'
      else
        puts 'That was an invalid entry'
      end
    when 2
      print 'Enter the teacher name: '
      name = gets.chomp.to_s
      print 'Enter the teacher\'s age: '
      age = gets.chomp
      print 'Enter the teacher\'s specialization: '
      specialization = gets.chomp
      teacher_permission = true
      @people.push(Teacher.new(name, age, specialization, teacher_permission))
      puts "#{name.capitalize} was added as a teacher successfully"
    end
  end

  # CREATE A BOOK METHOD
  def create_book
    puts 'Create a new book'
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "#{title} book was added successfully"
  end

  # CREATE A RENTAL METHOD
  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_number = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    list_people
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @people[person_number - 1], @books[book_number - 1]))
    @rentals.push(rental)

    puts 'Book rented successfully'
  end

  # LIST ALL RENTALS FOR A GIVEN PERSON ID
  def list_all_rentals
    print 'Enter Person\'s ID: '
    id = gets.chomp.to_i
    puts 'List of all Rentals books: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name}
        Date: #{rental.date},
        Book '#{rental.book.title}' written by #{rental.book.author}"
      else
        puts 'Checking for person......'
        puts 'No rentals found for the given ID for person'
      end
    end
  end

  def quit_app
    puts 'Thank you for using my app!'
    exit(true)
  end
end
