require_relative 'bike'
require_relative 'van'

class Garage

  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  def fix_bikes
    @fixed_bikes << @broken_bikes.delete_at(0)
  end

end
