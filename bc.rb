a = (0..9).to_a.shuffle.first(4)   #загадывает 4-значное число, состоящее из неповторяющихся цифр
errors = 0

while errors < 5                                   #за ограниченное число ходов.
  p "puts 4 numbers, u have #{5 - errors} trys"
  b = STDIN.gets.chomp.to_i                                     #ввод из консоли

  if a.join.to_i == b                                # Ваша задача - угадать его
    puts "bingo, u win!"
    exit
  else
    c = []
    p b = b.to_s.split('').map(&:to_i)      # То есть если загадано число “1234”,
    b.size.times {|i| c << b[i] if a[i] == b[i]}          #а вы называете “6531”,
    b -= c                                                # то результатом будет
    p "#{c.join(',')} buls" if c != []                      #и 1 бык (цифра “3”)
    p "#{(a & b).join(',')} cow" if (a & b) != []          #1 корова (цифра “1”)
  end
    errors += 1
end

puts "u loose"
