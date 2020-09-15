require_relative 'instance_counter.rb'

class Station
  include InstanceCounter
  attr_reader :name, :trains_list
  @@all = []

  def self.all
    @@all
  end

  def self.all=(item)
    @@all << item
  end
  
  def initialize(name)
    @name = name
    @trains_list = []
    self.class.all= self
    register_instance
  end

  def arrival(train)
    @trains_list << train 
  end

  def send_train(train)
    @trains_list.delete(train)
  end
end
