require_relative 'bike'
require_relative 'van'

class Garage

  attr_reader :fixed_bikes, :broken_bikes

  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  def unload_from_van(van)
    @broken_bikes << van.back_of_van.delete_at(0)
  end

  def fix_bikes(bike)
    bike.condition = 'working'
    @fixed_bikes << @broken_bikes.delete_at(0)
  end

end
