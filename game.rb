require './lib/capture_the_flag'
require './lib/bloc_sweeper'

system 'clear'

puts "What would you like to play?"
puts "1. Capture the flag"
puts "2. Bloc Sweeper"
print "Select: "

# choice = gets.chomp.to_i
choice = 1

if choice == 1
  puts "Loading Capture the Flag"
  CaptureTheFlag.new
else
  puts "Loading Bloc Sweeper"
end
