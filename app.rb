require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  # LIST ALL BOOKS METHOD
  def list_all_books
    puts 'There are no books found, Kindly add at least one book' if @books.empty?
    @books.each_with_index do |book, index|
      puts "(#{index + 1}) Book => Title: #{book.title}, Author: #{book.author}"
    end
  end

  # LIST ALL PEOPLES METHOD

  def list_all_people
    puts 'There are no people in the list. Kindly add at least one person' if @people.empty?
    @people.each_with_index do |person, index|
      puts "(#{index + 1}) [#{person.class}] => Id: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  # CREATE PERSON METHOD
  def create_person()
    puts 'Do you want to create a student(1) or a teacher(2)? [Enter a number 1 or 2]: '
    cartegory = gets.chomp.to_i
    case cartegory
    when 1
      print 'Enter the student name: '
      name = gets.chomp
      print 'Enter the student\'s age: '
      age = gets.chomp
      @people.push(Student.new('classroom', name, age))
      puts "#{name.capitalize} was added as a student successfully"
    when 2
      print 'Enter the teacher name: '
      name = gets.chomp
      print 'Enter the teacher\'s age: '
      age = gets.chomp
      print 'Enter the teacher\'s specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(specialization, name, age))
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
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_input = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_input = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_input], @people[person_input])
    @rentals.push(rental)
    puts 'Rental created successfully!'
  end

  # LIST ALL RENTALS FOR A GIVEN PERSON ID
  def list_all_rentals
    print 'Enter Person\'s ID: '
    id = gets.chomp.to_i
    puts 'List of all Rentals books: '
    @rentals.each do |rental|
      if rental.person.id.to_i == id.to_i
        puts "Person: #{rental.person.name}
        Date: #{rental.date},
        Book '#{rental.book.title}' written by #{rental.book.author}"
      else
        puts 'Checking for person......'
        puts 'No rentals found for the given ID for person'
      end
    end
  end
end
