require './person'

class Student < Person
  def initialize(age, name = 'Unknown', class_room, parent_permission = 'Unknown')
    super(age, parent_permission: parent_permission)
    @class_room = class_room
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
