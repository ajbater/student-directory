# This little program reads and prints it's own source code

File.open(__FILE__).each do |line|
  puts line
end
