###
# Fibonacci.js
# Calculate Fibonacci numbers in JavaScript. Ultrafast.
#
# @version 1.2.1
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

# Load existing numbers from file
filename = false;

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
		else if(arg.match(/.*\.fibonacci/) && process?)
			filename = arg;
		else if(!isNaN(arg))
			count = arg;

# Check if the count is bigger than 1477 without using Big.js
if count > 1477 & !bigjs
	console.log("The count you requested is to big. Please use Big.js with that (`-b`).");
	return;

# Get the start vars
if filename
	bigjs = true; # Required to parse the numbers
	
	# Read the file
	fs = require('fs');
	file = fs.readFileSync(fs.realpathSync(filename), {'encoding': 'utf-8'});
	json = JSON.parse(file);
	
	# Parse the contents
	for value in json.numbers.reverse()
		if !last1?
			last1 = value;
		else
			last2 = value;
			break;
		
		iStart = json.generated + 1;
		lastTime = json.time;
else
	last1 = 1;
	last2 = 0;
	iStart = 3;
	lastTime = 0;

# Load Big.js
if bigjs
	# Require Big.js
	Big = require('./big');

	# Hold the last two numbers in memory
	last1 = new Big(last1);
	last2 = new Big(last2);

# ##
# Let's start!
# ##

console.log("{\n	\"numbers\": [");

# Output the first two (loop does not output them)
if output & lastTime == 0
	console.log("		\"#{last2}\",");
	console.log("		\"#{last1}\",");

# Measure time
start = new Date().getTime();

if iStart < count
	for i in [iStart..count]
		current2 = last2;
		last2 = last1;
		
		if bigjs
			last1 = current2.plus(last1);
		else
			last1 = current2 + last1;
		
		console.log("		\"#{last1}\",") if output and i < count - 1;

# ##
# Finish
# ##

# Calculate the time the script took to generate the numbers
end = new Date().getTime();
time = end - start + lastTime;

# Output the resulting and last number to start over again
console.log("		\"#{last2}\",");
console.log("		\"#{last1}\"");

# Close the JSON
console.log("	],");

# Let's impress the user by telling him how fast it was :)
console.log("	\"time\": #{time},\n	\"generated\": #{count}\n}");
