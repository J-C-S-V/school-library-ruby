class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Create the has-many side (a book has many rentals).
  end

  def add_rental(rental)
    @rentals << rental # The << operator is used to push an element into an array.
  end
end
