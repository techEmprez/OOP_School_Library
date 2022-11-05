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
