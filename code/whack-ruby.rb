require 'ruby2d'

set title: "Whack a ruby", background: "black"

MAX_SCORE = 10
RUBY_WIDTH = 234

@sprite = Sprite.new(
  'ruby-sprite.png',
  clip_width: RUBY_WIDTH,
  width: RUBY_WIDTH,
  height: 192,
  time: 100,
  x: 50, y: 50,
  z: 10,
  loop: false
)

@hammer = Image.new(
  'hammer64.png',
  z: 20,
)

@score = 0

@text = Text.new(
  "Score: #{@score.to_s}",
  x: 0, y: 0,
  size: 40,
  color: 'blue',
)

tick = 0

update do
  if @score >= MAX_SCORE
    @sprite.remove
    Text.new(
      "You won!",
      x: 100, y: 100,
      size: 100,
      color: 'blue',
    )
  end
  if tick % 10 == 0
    @sprite.x = Random.rand(440)
    @sprite.y = Random.rand(280)
  end
  tick += 1
end

on :mouse_down do |event|
  unless @score >= MAX_SCORE
    # аналогичная проверка без метода contains
    # if event.x.between?(@sprite.x, @sprite.x + RUBY_WIDTH) && event.y.between?(@sprite.y, @sprite.y + RUBY_WIDTH)
    if @sprite.contains?(event.x, event.y)
      @sprite.play
      @score += 1
      @text.text = "Score: #{@score}"
    end
  end
end

on :mouse_move do |event|
  @hammer.x = event.x - 32
  @hammer.y = event.y - 32
end

show
