require 'docking_station'
require 'bike'

describe DockingStation do
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises en error when there it is at capacity' do
      20.times {subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station is full'
    end
  end
end
