
class Bulls

  def initialize
    @uniq_random_number = nil
    @user_input         = nil
    @array_bulls        = []
    @array_cow          = []
    @error              = 0
    @turn_numbers       = 5
  end

  def get_unirandnumber

    @uniq_random_number = ARGV[0]

    if @uniq_random_number != nil
        @uniq_random_number = @uniq_random_number.split('').map(&:to_i)
      else
        @uniq_random_number = (0..9).to_a.shuffle.first(4)
    end
  end

  def run
    get_unirandnumber
    while @error < @turn_numbers
      p "puts 4 numbers, u have #{5 - @error} trys"
      @user_input = STDIN.gets.chomp.to_i
      win
      get_bulls
      get_cow
      print_status
      @error += 1
    end
    puts "u loose"
  end

  def win
    if @uniq_random_number.join.to_i == @user_input
      puts "bingo, u win!"
      exit
    end

  end

  def get_bulls
    @user_input = @user_input.to_s.split('').map(&:to_i)
    @user_input.size.times do |i|
      @array_bulls << @user_input[i] if
      @uniq_random_number[i] == @user_input[i]
    end
  end

  def get_cow
    @user_input -= @array_bulls
    @array_cow << (@uniq_random_number & @user_input)
  end

  def print_status
    puts "#{@array_bulls.uniq.join(',')} buls" if @array_bulls != []
    puts "#{@array_cow.uniq.join(',')} cow" if @array_cow != []
  end

# def errors
#   error < turn_numbers?
# end

end

b = Bulls.new
b.run
