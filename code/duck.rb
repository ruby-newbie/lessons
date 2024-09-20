class Duck
  def quack
    puts "Quack"
  end

  def swim
    puts "I swim"
  end
end

class Roboduck
  def quack
    puts "roboQuack"
  end

  def swim
    puts "I swim like a robot"
  end
end

class DuckManager
  def initialize(ducks)
    @ducks = ducks
  end

  def test
    ducks.each { |d| d.quack }
    ducks.each { |d| d.swim }
  end

  private
  attr_reader :ducks
end

DuckManager.new([Duck.new, Roboduck.new]).test
