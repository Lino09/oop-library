require './corrector'
require './rental'

class Person
  def initialize(age, name = 'Unknown', parent_permission = 'Unknown')
    @id = rand(9999)
    @parent_permission = parent_permission
    @age = age
    @name = name
    @corrector = Corrector.new
    @rentals = []
  end
  attr_reader :id, :rentals
  attr_accessor :age, :name

  def can_use_services?
    (of_age? || @parent_permission)
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end
end
