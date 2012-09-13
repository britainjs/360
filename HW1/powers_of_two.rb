# A generator method that takes in a limit integer and yields the powers of 2 starting
# at 1 and ending at the limit. Must be passed to a block

def powers_of_two(limit)
    count = 0
    return if limit == 0
    while true
        yield 2**count
        count += 1
        return if (2**count) > limit        
    end
end