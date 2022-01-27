class Person
  def initialize(parent_permission = 'Unknown', age, name ='Unknown')
    @id = rand(9999)
    @parent_permission = parent_permission
    @age = age
    @name = name
  end
  attr_reader :id
  attr_accessor :age, :name

  def can_use_services?
    (is_of_age? || @parent_permission)
  end

  private
      def is_of_age?
        true unless @age >= 18
      end
end
