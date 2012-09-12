# Returns a random permutation of the input string s
# Splits the string into and array of characters, sorts the array randomly,
# then rejoins it into a string

def scramble(s)
    scrambled = s.split("").sort_by{rand}.join
end

# Randomizing method courtesy of 
# http://kl93.blogspot.com/2008/11/ruby-randomize-array.html