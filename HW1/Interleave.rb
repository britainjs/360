# A method that interleaves two arrays. If one array is longer than the other, than the
# remaining elements of the longer array will be placed at the end of the new array.
# Nil values will be removed.

def interleave(array1, array2)
    
    result = array1.zip(array2).flatten.compact
end

# A version of the method that does accept nil values. Code acquired from 
# http://stackoverflow.com/questions/3587227
# /how-to-interleave-arrays-of-different-length-in-ruby

def interleave(*args)
    max_length = args.map(&:size).max
    pad = Object.new()
    args = args.map{|a| a.dup.fill(pad,(a.size...max_length))}
    ([pad]*max_length).zip(*args).flatten-[pad]
end
