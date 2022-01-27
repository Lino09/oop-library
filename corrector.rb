class Corrector
  def correct_name(name)
    name[0] = name[0].upcase
    name[0,10]
  end
end