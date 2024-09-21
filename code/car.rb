class Car
  # конструктор
  def initialize(name, transmission = "МКПП")
    # aтрибуты/переменные экземпляра класса/ поля
    @name = name
    @transmission = transmission
  end

  # метод
  def info
    "Car: #{@name}\nTransmission: #{@transmission}\nIt's #{opinion}"
  end

  # метод
  def info_from_attr_accessors
    "Car: #{name}\nTransmission:#{transmission}"
  end

  private

  attr_accessor :name, :transmission

  def opinion
    transmission == "МКПП" ? "good" : "bad"
  end
end

class Honda < Car
  def info
    [@name, @transmission, opinion].join("/")
  end
end

car = Honda.new("Civic")
puts car.info

# создаём экземпляр класса
car = Car.new("Nissan Terrano", "МКПП")
puts car.info

puts "------"

# создаём экземпляр класса
car2 = Car.new("Kia Soul", "АКПП")
puts car2.info


