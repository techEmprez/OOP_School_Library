require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

 # CREATE A PERSON method (teacher or student not a plain person)
  def create_a_person()
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
