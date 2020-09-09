class Station
  attr_reader :name, :trains_list

  def initialize(name)
    @name = name
    @trains_list = []
  end

  def arrival(train)
    @trains_list << train 
  end

  def send_train(train)
    @trains_list.delete(train)
  end
end