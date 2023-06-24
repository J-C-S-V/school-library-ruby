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

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people_list << teacher
    puts "Teacher created with successfully"
    run_program
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books_list << book
    puts "Book created Successfully"
    run_program
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books_list.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    @people_list.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books_list[book_index], @people_list[person_index])
    @rentals_list << rental
    puts "Rental created successfully"
    run_program
  end

  def list_all_rentals
    if @rentals_list.empty?
      puts 'There are no rentals to show. Add a new one.'
    else
      print "Enter person's id: "
      id = gets.chomp.to_i
      found_person = @people_list.find { |person| person.id == id }
      if found_person
        found_person.rentals.each do |rental|
          puts "Rental date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author} "
        end
      else
        puts 'There is no rental data for that person ID.'
      end
    end
    run_program
  end

  def exit
    Kernel.exit(false)
  end
end
