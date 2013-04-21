# Fibonacci.js

> Calculate Fibonacci numbers in JavaScript. Ultrafast.

## Why the fuck?!

After [@\_Mr\_Spike\_](http://twitter.com/_Mr_Spike_) told me it takes 3 weeks to generate the 50th Fibonacci number, I created this script to test if that's true. :)

## How fast?

Damn fast. Calculating 1477 Fibonacci numbers (actually the highest number JavaScript can fit into a "number" data type) takes around 40 milliseconds on my machine.

## Usage

	coffee fibonacci.coffee <count> -o

or

	node fibonacci.js <count> -o

If `count` is not given, it will calculate 1477 numbers.
`-o` outputs all numbers but is extremely less ultrafast. ;)

### Save the Fibonacci numbers to a file

Easy as pie:

	node fibonacci.js -o > filename

### Run it in the browser

Of course, you can also use this in a browser.
Simply load the JavaScript file and watch the JavaScript console. :)