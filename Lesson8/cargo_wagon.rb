class CargoWagon < Wagon
  def take(take)
    @free = @total - take
    @occupied = @total - @free
  end
end
