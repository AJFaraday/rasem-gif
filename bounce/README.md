Concentric Circles
------------------

This creates a series of concentric circles, enlarging in size, following a sequence of colours.

To use:

* ruby make\_gif.rb
* open results/current.gif

ball.rasem is just taking an X and Y axis as arguments and drawing a single circle at those co-ordinates. Only it has a 'back-and-forth' algorithm for the X axis, so this can just keep increasing with each generation. 

make\_gif.rb takes two arguments:

1. Number of iterations (of position calculation)
2. Grain rate (if 2, every 2 position calculations will be used to generate a gif) 

Higher grain rates can be used to quickly generate a file which gives you the shape of longer gifs without taking so long to process.

In make\_gif.rb, the y position lowers by an amount which increases by a pixel each iteration, and when it reaches the bottom of the image it's speed is inverted, so it goes up as fast as it goes down. Then slows by that same pixel incremented amount, and lowers by it again. The effect is a ball speeding up towards the ground, bouncing, slowing and falling again. 
