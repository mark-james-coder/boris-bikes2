require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }
  let(:van) { double :van }

  it 'has a default capacity of 20 bikes' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike).to receive(:condition).and_return('working')
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end
    it 'releases a working bike' do
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:condition).and_return('working')
      subject.dock bike
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end
    it 'does not release a broken bike' do
      allow(bike).to receive(:condition).and_return('broken')
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end
    it 'raises an error when there are no working bikes available' do
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      allow(bike).to receive(:condition).and_return('working')
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises en error when it is at capacity and there is an attempt to dock another bike' do
      allow(bike).to receive(:condition).and_return('working')
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error 'Docking station is full'
    end
    it 'docks a bike if working' do
      allow(bike).to receive(:condition).and_return('working')
      expect(subject.dock bike).to eq [bike]
    end
    it 'docks a bike if broken' do
      allow(bike).to receive(:condition).and_return('broken')
      expect(subject.dock bike).to eq [bike]
    end
  end

  describe '#unload_repaired_bikes' do
    it 'unloads repaired bikes from the van into the working bikes section of the station' do
      allow(van).to receive_message_chain(:back_of_van, :delete_at).and_return(bike)
      subject.unload_repaired_bikes(van)
      expect(subject.working_bikes[0]).to eq bike
    end
  end

end
