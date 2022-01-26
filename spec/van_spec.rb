require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:docking_station) { double :docking_station }
  let(:garage) { double :garage }

  it 'loads broken bikes from a docking station' do
    allow(docking_station).to receive_message_chain(:broken_bikes, :delete_at).and_return(bike)
    subject.load_from_docking_station(docking_station)
    expect(subject.back_of_van).to eq [bike]
  end
  it 'loads fixed bikes from a garage' do
    allow(garage).to receive_message_chain(:fixed_bikes, :delete_at).and_return(bike)
    subject.load_from_garage(garage)
    expect(subject.back_of_van).to eq [bike]
  end
  
end
