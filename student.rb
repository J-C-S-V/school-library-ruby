class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
