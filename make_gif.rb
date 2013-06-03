def run_and_show(command='')
  puts command
  system command
end

run_and_show "rm -rf images"
run_and_show "mkdir images"

# Produce successive images with an extra object eacg
29.times do |i|
  index = i+1
  run_and_show "rasem methods.rasem #{index}"

  filename = "images/#{"%03d"%index}.svg"
  run_and_show "mv methods.svg images/#{"%03d"%index}.svg"
end

# use ImageMagick to stitch them together as a gif

run_and_show "convert -delay 20 -loop 0 images/*.svg result.gif"
