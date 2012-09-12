# Reports the number of non-blank, non-commented lines in the file named
# by the first argument.


if !File.exist?(ARGV[0]) 
    raise ArgumentError, "No such file"
end

input = File.new(ARGV[0])

lines = 0;
while !input.eof
    current = input.readline
    if /[^\n'#']/.match(current)
        0.upto(current.length) do |x|
            if /\S/.match(current)
                lines = lines + 1
                puts current[x] == ''
                break
            end
        end
    end
end
puts lines

        