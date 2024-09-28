require 'ruby2d'

set title: "Square"

@square = Square.new(
  x: 100, y: 200,
  size: 125,
  color: 'blue',
  z: 10
)

@x_speed = 0
@y_speed = 0

# on :key_down do |event|
#   # здесь доступен объект event, можно изучить его свойства
#   if event.key == "down"
#   elsif event.key == "up"
#     @square.color = "blue"
#   end
# end

on :key_down do |event|
  case event.key
  when 'left'
    @x_speed = -2
    @y_speed = 0
    @square.color = "red"
  when 'right'
    @x_speed = 2
    @y_speed = 0
    @square.color = "orange"
  when 'up'
    @x_speed = 0
    @y_speed = -2
    @square.color = "green"
  when 'down'
    @x_speed = 0
    @y_speed = 2
    @square.color = "yellow"
  when 'space'
    @x_speed = 0
    @y_speed = 0
    @square.color = "blue"
  end
end

update do
  @square.x += @x_speed
  @square.y += @y_speed
end

show
