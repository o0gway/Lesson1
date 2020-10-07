class PassengerTrain < Train
  validate :number, :format, NUMBER_FORMAT
end
