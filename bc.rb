puts "Greetins young gamer. I'm glad to to provide to you this wonderful game." +
"Your task - to guess it for limited number of the courses. Cows (the digit is" +
"guessed, but its line item - is not present) and bulls act as hints" +
"(when both the digit and its line item matches). That is if number 1234 is" +
"thought, and you call 6531, then 1 cow (digit 1) and 1 bull (digit 3)" +
"will be result."

# ручной ввод уникального числа при вызове файла и передаче его в качестве аргумента
uniq_random_number = ARGV[0].split('').map(&:to_i)

# если числе не было переданно, то компъюктер сам его генерирует
if uniq_random_number == nil
  uniq_random_number = (0..9).to_a.shuffle.first(4)
end

# ошибки и количество ходов
errors = 0
turn_numbers = 5

# проверка условия на оставшиеся кол-во ходов, и ручной ввод цифр пользователем
while errors < turn_numbers
  p "puts 4 numbers, u have #{5 - errors} trys"
  user_input = STDIN.gets.chomp.to_i

# условие на победку при отгадывании числа, else сравнение элементов двух
# массивов по индексам, при совпаденнии " buls" добавление его в новый массив.
# Из массива цифр введённого пользователем удаляем массив получившися при совпадении.
# При пересечении получившегося массива с массивом загаданным компътером получаем
# совпадение для "cow"
  if uniq_random_number.join.to_i == user_input
    puts "bingo, u win!"
    exit
  else
    array_temp = []
    user_input = user_input.to_s.split('').map(&:to_i)
    user_input.size.times do |i|
      array_temp << user_input[i] if
      uniq_random_number[i] == user_input[i]
    end
    user_input -= array_temp
    puts "#{array_temp.join(',')} buls" if array_temp != []
    puts "#{(uniq_random_number & user_input).join(',')} cow" if
    (uniq_random_number & user_input) != []
  end
    errors += 1
end

puts "u loose"
