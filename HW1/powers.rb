# A generator method that yields powers of an arbitrary base up to a specified limit

def powers(base, limit)

    count = 0
    return if (base ==  0) | (base == 1)
    
    while true
        yield base**count
        count += 1
        return if base**count > limit
    end
end