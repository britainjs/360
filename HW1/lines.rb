# Reports the number of non-blank, non-commented lines in the file named
# by the first argument.


if !File.exist?(ARGV[0]) 
    raise ArgumentError, "No such file"
end

count = 0;
ARGF.each do |line|
    if /[^\n'#']/.match(line)
        line.chars do |x|
            if /\S/.match(x)
                count += 1
                break
            end
        end
    end
end
puts count

        