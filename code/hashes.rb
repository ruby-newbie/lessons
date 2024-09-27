# с ключами symbols (неизменяемые строки)
my_hash = { name: "Анна", nickname: "lightalloy" }
# доступ к значениям
p my_hash[:name]
# => "Анна"
p my_hash[:nickname]
# => "lightalloy"

# с ключами-строками
str_keys_hash = { "method" => "POST", "id" => 1 }

p str_keys_hash["method"]
# => "POST"
p str_keys_hash["id"]
# => 1
p str_keys_hash[:id]
# => nil

# есть всякие методы
puts my_hash.keys
puts my_hash.values

# обход хэша
my_hash.each do |key, value|
  puts "key - #{key}, value - #{value}"
end

# ключами могут быть объекты разных типов





