uniq_random_number = (0..9).to_a.shuffle.first(4)   #загадывает 4-значное число,
errors = 0                                    #состоящее из неповторяющихся цифр

while errors < 5                                    #за ограниченное число ходов
  p "puts 4 numbers, u have #{5 - errors} trys"
  user_input = STDIN.gets.chomp.to_i                            #ввод из консоли

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
