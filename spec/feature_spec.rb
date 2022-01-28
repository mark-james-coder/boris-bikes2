require '/Users/Mark/projects/boris_bikes3/lib/bike.rb'
require '/Users/Mark/projects/boris_bikes3/lib/docking_station.rb'
require '/Users/Mark/projects/boris_bikes3/lib/garage.rb'
require '/Users/Mark/projects/boris_bikes3/lib/van.rb'

class FeatureTest

  def initialize
    @bike = Bike.new
    @station = DockingStation.new
    @garage = Garage.new
    @van = Van.new
  end

  def run_tests
    puts "First, there is a working bike."
    @station.dock(@bike)
    puts "Then, it is docked at the docking station."
    puts "A customer comes along and inserts a fee of £1 into the docking_station."
    @station.release_bike(1)
    puts "The bike is then released to the customer."
    puts "You can see the docking_station now contains £#{@station.money_container[0]}"
    puts "After, the customer reports the bike as broken."
    @bike.report_broken
    puts "You can see the condition of the bike is #{@bike.condition}"
    puts "It is docked at the docking station."
    @station.dock(@bike)
    puts "You can see the bike among the broken bikes: #{@station.broken_bikes}"
    puts "The van comes to pick up the broken bike to take it to be repaired at the garage."
    @van.load_from_docking_station(@station)
    puts "You can see the broken bike in the back of the van: #{@van.back_of_van}"
    puts "The broken bike is unloaded from the van into the garage."
    @garage.unload_from_van(@van)
    puts "You can see the broken bike in the broken bikes section of the garage: #{@garage.broken_bikes}"
    puts "The garage fixes the bike."
    @garage.fix_bikes(@bike)
    puts "You can now see the fixed, working bike in the fixed bikes section of the garage: #{@garage.fixed_bikes}"
    puts "The van comes back to pick up the fixed bike from the garage."
    @van.load_from_garage(@garage)
    puts "You can see the working bike in the back of the van: #{@van.back_of_van}"
    puts "The van arrives at the docking station and the bike is unloaded into the working bikes section of the station."
    @station.unload_repaired_bikes(@van)
    puts "You can now see the bike among the station's working bikes: #{@station.working_bikes}"
    puts "And, you see that the station's broken bikes section is empty: #{@station.broken_bikes}"
  end

end
