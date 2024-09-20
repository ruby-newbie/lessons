class Car
  attr_accessor :name, :transmission

  # конструктор
  def initialize(name, transmission)
    # aтрибуты/переменные экземпляра класса/ поля
    @name = name
    @transmission = transmission
  end

  # метод
  def info
    "Car: #{@name}\nTransmission: #{@transmission}"
  end

  # метод
  def info_from_attr_accessors
    "Car: #{name}\nTransmission:#{transmission}"
  end
end

# создаём экземпляр класса
car = Car.new("Nissan Terrano", "МКПП")
puts car.info

# создаём экземпляр класса
car2 = Car.new("Kia Soul", "АКПП")
puts car2.info_from_attr_accessors
