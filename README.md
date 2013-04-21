# Fibonacci.js

> Calculate Fibonacci numbers in JavaScript. Ultrafast.

## Why the fuck?!

After [@\_Mr\_Spike\_](http://twitter.com/_Mr_Spike_) told me it takes 3 weeks to generate the 50th Fibonacci number using recursion, I created this script to check if I can do better without recursion but with iteration.

Programming is just !== math and works different. ;)

## How fast?

Damn fast. Calculating 1477 Fibonacci numbers (actually the highest number JavaScript can fit into a "number" data type) takes around 40 milliseconds on my machine using the `-o` flag.

If you omit the output and just echo the last number, it takes about 0 milliseconds. Cool, hm? :)

Really big Fibonacci numbers need [Big.js](https://github.com/MikeMcl/big.js), which is less ultrafast but still quite fast.

## Usage

	coffee fibonacci.coffee [<count>] [-o] [-b]

or

	node fibonacci.js [<count>] [-o] [-b]

If `count` is not given, it will calculate 1477 numbers.

`-o` outputs all numbers but is extremely less ultrafast. ;)

`-b` uses [Big.js](https://github.com/MikeMcl/big.js) which is less ultrafast but works with big numbers without echoing `Infinite`.

### Save the Fibonacci numbers to a file

Easy as pie:

	node fibonacci.js -o > filename

### Run it in the browser

Of course, you can also use this in a browser.
Simply load the JavaScript file and watch the JavaScript console. :)

You can't use [Big.js](https://github.com/MikeMcl/big.js) in the browser - you are limited to 1477 Fibonacci numbers.

## Credits

- [@\_Mr\_Spike\_](http://twitter.com/_Mr_Spike_) for the idea
- [Big.js](https://github.com/MikeMcl/big.js)