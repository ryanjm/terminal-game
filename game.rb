require './lib/capture_the_flag'
require './lib/bloc_sweeper'

system 'clear'

puts "Capture the flag.\nIn this game two players setn\ntheir flags and then try to\nguess eachother's position"
puts "\nBloc Sweeper.\nA flag is randomly placed and\nyou try to guess where it is.\nBut watch out! There are bombs\nwhich will take one of your 10 lives."

puts "\nWhich would you like to play?"
puts "1. Capture the flag"
puts "2. Bloc Sweeper"
puts "3. Exit"
print "Select: "

choice = gets.chomp.to_i

if choice == 1
  puts "Loading Capture the Flag"
  CaptureTheFlag.new
elsif choice == 2
  puts "Loading Bloc Sweeper"
  BlocSweeper.new
else
  puts "Exiting"
end
