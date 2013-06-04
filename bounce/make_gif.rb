# This creates the bouncing ball animation with two arguments
# * The number of times the position of the ball will be calculated
# * How many calculations between SVG generations
#
# E.G.:
# ruby make_gif.rb 100 2
#
# set constants from arguments or defaults
if ARGV[0] and ARGV[0].to_i > 0
  ITERATIONS = ARGV[0].to_i
else
  ITERATIONS = 300
end

if ARGV[1] and ARGV[1].to_i > 0
  GRAIN_RATE = ARGV[1].to_i
else
  GRAIN_RATE = 1
end
system 'rm log.txt'
system 'touch log.txt'
LOG = File.open('log.txt','a')

def run_and_show(command='')
  puts command
  system command
  LOG.write "#{command}\n"
end

run_and_show "rm -rf images"
run_and_show "mkdir images"

# Produce successive images with one object each

# starting position
y = 0
# a positive number will drop the ball
offset = 1
y_no_bounce = false

x = 0

ITERATIONS.times do |index|

  if index % GRAIN_RATE == 0
    run_and_show "rasem ball.rasem #{x} #{y}"
    filename = "images/#{"%09d"%index}.svg"
    run_and_show "mv ball.svg #{filename}"
  end
  

  x += 5

  y += offset
  offset += 1
  if y > 600 and !y_no_bounce
    offset *= -1 
    offset *= 0.8
    y_no_bounce = true
  end
  y_no_bounce = false if y_no_bounce and y<600

end

# This frame rate should keep the speed the same, regardless of grain rate
frame_rate = 10 * GRAIN_RATE
# use ImageMagick to stitch them together as a gif
run_and_show 'mkdir results'
filename = "results/result_#{ITERATIONS}_#{GRAIN_RATE}.gif"
run_and_show "convert -delay #{frame_rate} -loop 0 images/*.svg results/current.gif"
run_and_show "cp results/current.gif #{filename}"
