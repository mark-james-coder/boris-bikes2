require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(default_capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = default_capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Sorry, bike is broken' if bikes[-1].condition == 'broken'
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' if fall?
    @bikes << bike
  end

  def unload_repaired_bikes(van)
    @bikes << van.back_of_van.delete_at(0)
  end

  private

  def fall?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
