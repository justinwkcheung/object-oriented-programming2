class Person

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greeting
    return "Hi, my name is #{name}"
  end
end


class Student < Person
  def learn
    return "I get it!"
  end
end

class Instructor < Person
  def teach
    return "Everything in Ruby is an object"
  end
end

chris = Instructor.new("Chris")
puts chris.greeting
cristina = Student.new("Cristina")
puts cristina.greeting

puts chris.teach
puts cristina.learn
# puts christina.teach doesn't work because .teach is an instance method that only applies to instructors because it was created in the Instrutors class rather than the Person class
