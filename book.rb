class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Create the has-many side (a book has many rentals).
  end

  def add_rental(person, date)
    Rental.new(date, self, person) # Create a new rental, with the book and person.
  end
end
