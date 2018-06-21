uniq_random_number = ARGV[0].split('').map(&:to_i)

if uniq_random_number == nil
  uniq_random_number = (0..9).to_a.shuffle.first(4)
end
errors = 0

while errors < 5
  p "puts 4 numbers, u have #{5 - errors} trys"
  user_input = STDIN.gets.chomp.to_i

  if uniq_random_number.join.to_i == user_input
    puts "bingo, u win!"
    exit
  else
    array_temp = []
    user_input = user_input.to_s.split('').map(&:to_i)
    user_input.size.times {|i| array_temp << user_input[i] if
    uniq_random_number[i] == user_input[i]}
    user_input -= array_temp
    puts "#{array_temp.join(',')} buls" if array_temp != []
    puts "#{(uniq_random_number & user_input).join(',')} cow" if
    (uniq_random_number & user_input) != []
  end
    errors += 1
end

puts "u loose"
