# Duplicates every item in the given array, putting the duplicate right 
# after the original

def stutter
    
    x = 0
    while x < self.length
        self.insert(x+1, self[x])
        x += 2
    end
    return self
end