class PassengerWagon < Wagon
  def take
    @free = total - 1
    @occupied = @total - @free
  end
end
