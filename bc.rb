
class Bulls

  def initialize
    @uniq_random_number = nil
    @user_input         = nil
    @array_bulls        = []
    @array_cows         = []
    @error              = 0
    @turn_numbers       = 5
  end

  # ручной ввод уникального числа при вызове файла и передаче его в качестве аргумента
  # преобразование его до массива чисел
  # если числе не было переданно, то компъюктер сам его генерирует
  def get_unirandnumber                      # загаданный уникальный номер
    @uniq_random_number = ARGV[0]
    if @uniq_random_number != nil
        @uniq_random_number = @uniq_random_number.split('').map(&:to_i)
    else
        @uniq_random_number = (0..9).to_a.shuffle.first(4)
    end
  end

  # основное тело с методами
  def run
    get_unirandnumber
    while @error < @turn_numbers
      get_user_input
      win
      get_bulls
      get_cows
      print_status
      @error += 1
    end
    puts "\nu loose\n"
  end

  def win                                        # метод проверки на победку
    if @uniq_random_number.join.to_i == @user_input
      puts "\nbingo, u win!\n"
      exit
    end
  end

  # преобразование пользовательского ввода до массива цифр и по длине этого массива
  # запускается метод times в котором сравнивает значения с одинаковым индексом и при
  # совпадении добавляет в массив с быками
  def get_bulls                             # метод получения цифер с быками
    @user_input = @user_input.to_s.split('').map(&:to_i)
    @user_input.size.times do |i|
      @array_bulls << @user_input[i] if
      @uniq_random_number[i] == @user_input[i]
    end
  end

  # из массива коров удаляет элементы содержащиеся в массиве быков, так же из пользовательского
  # ввода удаляются элементы из быков, чтобы не дублировались в коровах при выводе
  def get_cows # метод получения цифер с коровами
    @array_cows -= @array_bulls
    @user_input -= @array_bulls
    @array_cows += (@uniq_random_number & @user_input)
  end

  def print_status                              # метод вывода быков и коров
    puts "#{@array_bulls.uniq.join(',')} buls" if @array_bulls != []
    puts "#{@array_cows.uniq.join(',')} cow" if @array_cows != []
  end

  # бесконечный цикл в котором просят ввести 4е цифры и пока не введут цикл не закончится
  def get_user_input                    # метод пользовательского ввода цифр
    loop do
      puts "puts 4 numbers, u had #{@turn_numbers - @error} attempts"
      @user_input = STDIN.gets.chomp.to_i
      if @user_input.instance_of?(Integer) &&
          @user_input.to_s.split('').map(&:to_i).size == 4
        break
      end
      puts "wrong input\n"
    end
  end

end

b = Bulls.new
b.run
