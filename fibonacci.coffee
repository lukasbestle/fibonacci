###
 * Fibonacci.js
 * Calculate Fibonacci numbers in JavaScript. Ultrafast.
 *
 * @version 1.0
 * @author Lukas Bestle <http://lu-x.me>
 * @link https://github.com/vis7mac/fibonaccijs
 * @copyright Copyright 2013 Lukas Bestle
 * @license http://www.apache.org/licenses/LICENSE-2.0 Apache License, Version 2.0
 * @file fibonacci.coffee
###

# Measure time
start = new Date().getTime();

# Hold the last two numbers in memory
last1 = 1;
last2 = 0;

# Output the first two (loop does not output them)
console.log("1: #{last2}");
console.log("2: #{last1}");

# Set the count of Fibonacci numbers (can be passed on command line)
# 1477 is the highest Fibonacci number the data type "number" is big enough for
numbers = process.argv[2] || 1477;

for i in [3..numbers]
	current2 = last2;
	last2 = last1;
	last1 = current2 + last1;
	
	console.log("#{i}: #{last1}");

# Let's impress the user by telling him how fast it was :)
end = new Date().getTime();
time = end - start;
console.log("\nCalculating took #{time} milliseconds. YAY!");
