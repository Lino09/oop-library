class Person
  def initialize(age, name = 'Unknown', parent_permission: 'Unknown')
    @id = rand(9999)
    @parent_permission = parent_permission
    @age = age
    @name = name
  end
  attr_reader :id
  attr_accessor :age, :name

  def can_use_services?
    (of_age? || @parent_permission)
  end

  private

  def of_age?
    @age >= 18
  end
end
