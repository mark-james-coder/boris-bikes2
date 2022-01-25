require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

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

  private

  def fall?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
