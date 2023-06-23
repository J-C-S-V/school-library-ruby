class Rental
  attr_accessor :date
  
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.rentals << self # Create the has-many side (a book has many rentals).
    @person.rentals << self # Create the has-many side (a person has many rentals).
  end
end