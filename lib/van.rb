require_relative 'bike'

class Van

  attr_reader :back_of_van

  DEFAULT_CAPACITY = 1

  def initialize
    @back_of_van = []
  end

  def load_from_docking_station(docking_station)
    @back_of_van << docking_station.broken_bikes.delete_at(0)
  end

  def load_from_garage(garage)
    @back_of_van << garage.fixed_bikes.delete_at(0)
  end

end
