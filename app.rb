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
    puts 'Select the id of the book you want: '
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    number = gets.chomp.to_i
    index = number - 1

    puts 'Type your ID: '
    @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
    identity = gets.chomp.to_i

    individual = @people.select { |person| person.id == identity }.first

    print 'Enter date of renting the book:(yyyy-mm-dd) '
    date = gets.chomp.to_s
    rent = Rental.new(date, @books[index], individual)
    @rentals << rent

    puts 'Book rented successfully'
  end

  # LIST ALL RENTALS FOR A GIVEN PERSON ID
  def list_all_rentals_id
    puts 'There are no rentals available at the moment' if @rentals.empty?
    print 'Wonderful! let\'s find your book!\n, Type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rent| rent.person.id == id }
    if rental.empty?
      puts 'Sorry there are no records for that ID'
    else
      puts 'Here are your records: '
      puts ''
      rental.each_with_index do |record, index|
        puts "#{index + 1}) Date: #{record.date} Borrower: #{record.person.name}
         Status: #{record.person.class} Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
      end
    end
  end

  def quit_app
    puts 'Thank you for using my app!'
    exit(true)
  end
end
