###
 * Fibonacci.js
 * Calculate Fibonacci numbers in JavaScript. Ultrafast.
 *
 * @version 1.1
 * @author Lukas Bestle <http://lu-x.me>
 * @link https://github.com/vis7mac/fibonaccijs
 * @copyright Copyright 2013 Lukas Bestle
 * @license http://www.apache.org/licenses/LICENSE-2.0 Apache License, Version 2.0
 * @file fibonacci.coffee
###

# Set the count of Fibonacci numbers (can be passed on command line)
# 1477 is the highest Fibonacci number the data type "number" is big enough for
if process.argv[2] == '-o'
	numbers = process.argv[3] || 1477;
else if process.argv[2]
	numbers = process.argv[2];
else
	numbers = 1477;

# Output all numbers in between? (takes a long, long time)
if process.argv.lastIndexOf('-o') != -1
	output = true;
else
	output = false;

# Hold the last two numbers in memory
last1 = 1;
last2 = 0;

# Output the first two (loop does not output them)
if output
	console.log("1: #{last2}");
	console.log("2: #{last1}");

# Measure time
start = new Date().getTime();

for i in [3..numbers]
	current2 = last2;
	last2 = last1;
	last1 = current2 + last1;
	
	console.log("#{i}: #{last1}") if output and i != numbers;

# Calculate the time the script took to generate the numbers
end = new Date().getTime();
time = end - start;

# Output the resulting number
console.log("#{numbers}: #{last1}");

# Let's impress the user by telling him how fast it was :)
console.log("\nCalculating took #{time} milliseconds. YAY!");
