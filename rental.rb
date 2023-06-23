class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.add_rental(self) # Create the belongs-to side (a rental belongs to a book).
    @person.rentals << self # Create the has-many side (a person has many rentals).
  end
end
