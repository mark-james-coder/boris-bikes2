require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:docking_station) { double :docking_station }

  it 'loads broken bikes from a docking station' do
    allow(docking_station).to receive(:broken_bikes.delete_at).and_return(bike)
    # allow(docking_station).to receive(:delete_at).and_return(bike)
    subject.load_from_docking_station(docking_station)
    expect(subject.back_of_van).to eq bike
  end

end
