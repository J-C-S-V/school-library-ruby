class classroom
  attr_accessor :label, :students
  
  def initialize(label)
    @label = label
    @students = [] # Create the has-many side (a classroom has many students).
  end

  def add_student(student)
    @students << student
    student.classroom = self # Create the belongs-to side (a student belongs to a classroom).
  end
end