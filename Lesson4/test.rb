class Test
  attr_reader :train_number
  def initialize(train_number)
    @train_number = train_number
  end
end

trains = []

user_choice = gets.strip.downcase

trains << Test.new(user_choice)

trains.each {|item| puts item.train_number}



