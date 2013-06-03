RASEM animation
---------------

This is a quick look at producing SVG based gif animation using the rasem gem.

All instructions are for use in linux, MAC instructions may vary. (Best guess is that you just can't in windows)

Before you start:

* sudo apt-get install ruby rubygems imagemagick
* sudo gem install rasem
* git clone git@github.com:AJFaraday/rasem-gif.git

From within the rasem-gif folder:

* ruby make\_gif.rb
* Open resutl.gif and enjoy

This is currently a rough sketch, proving the concept to myself. But it has the template for producing an iterative set of SVG files and converting these to an animated gif so you can see the process unfolding. In short:

* methods.rasem will use the method make\_circle the number of times from the first argument it has (e.g. `rasem methods.rasem 4` will run make\_circle 4 times) and output it to methods.svg
* make\_gif.rb runs this 29 times with the arguments 1 to 29, and moves the results to sequential files in a folder called images (001.svg to 029.svg)
* next it runs convert, from imagemagick, to stitch these together as a gif


