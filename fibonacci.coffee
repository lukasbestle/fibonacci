###
# Fibonacci.js
# Calculate Fibonacci numbers in JavaScript. Ultrafast.
#
# @version 1.2
# @author Lukas Bestle <http://lu-x.me>
# @link https://github.com/vis7mac/fibonaccijs
# @copyright Copyright 2013 Lukas Bestle
# @license http://www.apache.org/licenses/LICENSE-2.0 Apache License, Version 2.0
# @file fibonacci.coffee
###

# ##
# Default values
# Can be overridden from the command line
# ##

# Set the count of Fibonacci numbers
# 1477 is the highest Fibonacci number the data type "number" is big enough for
# If using a higher number, `-b` (Big.js) has to be used which is less ultrafast
count = 1477;

# Output all numbers in between?
# Less ultrafast
output = false;

# Shall I use Big.js?
# Less ultrafast
bigjs = false;

# ##
# Preparation
# ##

# Get options from command line
if process.argv?
	for arg in process.argv
		if(arg == '-o')
			output = true;
		else if(arg == '-b' && process?)
			bigjs = true;
		else if(!isNaN(arg))
			count = arg;

# Check if the count is bigger than 1477 without using Big.js
if count > 1477 & !bigjs
	console.log("The count you requested is to big. Please use Big.js with that (`-b`).");
	return;

# Load Big.js
if bigjs
	# Require Big.js
	Big = require('./big');

	# Hold the last two numbers in memory
	last1 = new Big('1');
	last2 = new Big('0');
else
	# Hold the last two numbers in memory
	last1 = 1;
	last2 = 0;

# ##
# Let's start!
# ##

# Output the first two (loop does not output them)
if output
	console.log("1: #{last2}");
	console.log("2: #{last1}");

# Measure time
start = new Date().getTime();

for i in [3..count]
	current2 = last2;
	last2 = last1;
	
	if bigjs
		last1 = current2.plus(last1);
	else
		last1 = current2 + last1;
	
	console.log("#{i}: #{last1}") if output and i < count;

# ##
# Finish
# ##

# Calculate the time the script took to generate the numbers
end = new Date().getTime();
time = end - start;

# Output the resulting number
console.log("#{count}: #{last1}");

# Let's impress the user by telling him how fast it was :)
console.log("\nCalculating took #{time} milliseconds. YAY!");
