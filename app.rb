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
  def create_rental()
    puts 'Select a book from the following list by the book number: '
    list_all_books
    book_number = gets.chomp.to_i
    puts 'Book selected'
    puts 'Select a person from the following list by the person\'s number: '
    list_all_people
    person_number = gets.chomp.to_i
    puts 'Person selected'
    print 'Date: '
    date = gets.chomp
    puts 'Date of renting book is added'
    @rentals.push(Rental.new(date, @people[person_number - 1], @books[book_number - 1]))
    puts 'Rental book created successfully'
  end

  # LIST ALL RENTALS FOR A GIVEN PERSON ID
  def list_all_rentals
    list_people
    print 'ID of person: '
    input_id = gets.chomp.to_i
    person = nil
    @people.each do |item|
      person = item if item.id == input_id
    end

    puts 'Rentals: '
    person.rentals.each do |rental|
      puts "Date #{rental.date}, Book '#{rental.book.title}', by #{rental.book.author} "
    end
  end
end
