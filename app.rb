require './person'
require './book'
require './classroom'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @people_list = []
    @books_list = []
    @rentals_list = []
  end

  def run_program
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    choice = gets.chomp
    case choice
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    when '7'
      exit
    else
      puts 'Invalid option. Please try again.'
      run_program
    end
  end

  private

  def list_all_books
    @books_list.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    run_program
  end

  def list_all_people
    @people_list.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, "
    end
    run_program
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option. Please try again.'
      create_person
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people_list << student
    puts "Student created successfully"
    run_program
  end
end
