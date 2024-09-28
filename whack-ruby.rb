require 'ruby2d'

set title: "Whack a ruby", background: "black"

MAX_SCORE = 15

@score = 0

@ruby = Sprite.new(
  'images/ruby-sprite.png',
  clip_width: 234,
  time: 30,
  height: 192,
  width: 234,
  loop: false
)

@hammer = Image.new(
  'images/hammer.png',
  z: 20,
)

@score_text = Text.new("Score: #{@score}", size: 50)

tick = 0

on :mouse_down do |event|
  if @ruby && @ruby.contains?(event.x, event.y)
    increase_score
  end
end

on :mouse_move do |event|
  @hammer.x = event.x - @hammer.width/2
  @hammer.y = event.y- @hammer.height/2
end

update do
  if @score >= MAX_SCORE
    finish_game
  else
    if tick % 6 == 0
      @ruby.x = Random.rand(Window.width - @ruby.width)
      @ruby.y = Random.rand(Window.height - @ruby.height)
    end
    tick += 1
  end
end


def increase_score
  @score += 1
  @score_text.text = "Score: #{@score}"
  @ruby.play
end

def finish_game
  @score_text.remove
  @ruby.remove
  Text.new('You won!', size: 50, x: Window.width/2 - 25, y: Window.height/2 - 25)
end


show


