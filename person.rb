class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  MAX_LENGTH = 10

  def correct_name
    super[0...MAX_LENGTH]
  end
end

class Person < Nameable
  attr_reader :id
  attr_accessor :age, :name

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts  person.correct_name

capitalizedPerson = CapitalizeDecorator.new(person)
puts  capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts  capitalizedTrimmedPerson.correct_name
