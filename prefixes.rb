# Writes successive prefixes of the first input for args, starting with a prefix of 
# length 0.

input = ARGV[0]
puts ""
0.upto(input.length-1) {|x| puts input.slice(0..x)}