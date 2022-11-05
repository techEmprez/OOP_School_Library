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
    puts
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
    end
  end

  # CREATE PERSON METHOD
  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input the number]'
    input = gets.chomp.to_i
    case input
    when 1
      create_student
    when 2
      create_teacher
    else puts 'Invalid entry'
    end
  end

  # CREATE STUDENT METHOD
  def create_student
    puts 'student\'s age: '
    age = gets.chomp.to_i
    if age < 5 || age > 65 || age.nil?
      puts 'Sorry, a student must have a valid age'
      return
    end

    puts 'student\'s name: '
    name = gets.chomp

    puts 'does student have parent permission? [Y/N]'
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      true
    when 'N'
      false
    end

    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Person created successfully!'
  end

  # CREATE TEACHER METHOD
  def create_teacher
    puts 'Teacher\'s age: '
    age = gets.chomp.to_i
    if age < 18 || age > 65 || age.class != Integer || age.nil?
      puts 'Sorry, a teacher must have a valid age'
      return
    end

    puts 'Teacher\'s name: '
    name = gets.chomp

    puts 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Person created successfully!'
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
