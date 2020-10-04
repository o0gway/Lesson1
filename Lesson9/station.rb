require_relative 'instance_counter'
require_relative 'accessors'

# Class Station
class Station
  include InstanceCounter
  include Accessors

  attr_accessor_with_history :str

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
    validate!
    @trains_list = []
    self.class.all = self
    register_instance
  end

  def arrival(train)
    @trains_list << train
  end

  def send_train(train)
    @trains_list.delete(train)
  end

  def validate!
    raise 'Название станции не может быть пустым!' if name == ''
  end

  def each_train
    trains_list.each.with_index(1) { |train, index| yield(train, index) }
  end
end
