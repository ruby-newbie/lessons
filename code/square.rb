require 'ruby2d'

INITIAL_X = 20
INITIAL_Y = 20

# Рисуем квадрат
@square = Square.new(x: INITIAL_X, y: INITIAL_Y, size: 50, color: 'blue')

# Скорость движения по осям x и y
@x_speed = 0
@y_speed = 0

# Обработка события нажатия клавиш
# Меняем скорость движения по осям x и y и цвет
on :key_down do |event|
  case event.key
  when 'right'
    @square.x += 10
    @square.color = 'red'
  when 'left'
    @square.x -= 10
    @square.color = 'orange'
  when 'down'
    @square.y +=10
    @square.color = 'green'
  when 'up'
    @square.y -= 10
    @square.color = 'yellow'
  when 'd'
    @x_speed += 1
  when 'a'
    @x_speed -= 1
  when 's'
    # return to initial coords + stop
    @square.x = INITIAL_X
    @square.y = INITIAL_Y
    @x_speed = @y_speed = 0
    @square.color = 'blue'
  when 'space'
    # stop
    @x_speed = @y_speed = 0
    @square.color = 'blue'
  end
end

update do
  @square.x += @x_speed
  @square.y += @y_speed
end

show
