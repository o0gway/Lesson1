class CargoTrain < Train
  validate :number, :format, NUMBER_FORMAT
end
