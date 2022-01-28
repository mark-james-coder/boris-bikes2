require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity, :working_bikes, :broken_bikes, :money_container

  DEFAULT_CAPACITY = 20

  def initialize(default_capacity=DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @money_container = []
    @capacity = default_capacity
  end

  def release_bike(money)
    fail 'No working bikes available' if empty?
    @money_container << money
    @working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' if fall?
    if bike.condition == 'working'
      @working_bikes << bike
    else
      @broken_bikes << bike
    end
  end

  def unload_repaired_bikes(van)
    @working_bikes << van.back_of_van.delete_at(0)
  end

  private

  def fall?
    @working_bikes.count + @broken_bikes.count >= capacity
  end

  def empty?
    @working_bikes.empty?
  end

end
