describe Garage do

  let(:van) { double :van }
  let(:bike) { double :bike }

  describe '#unload_from_van' do
    it 'unloads broken bikes from the van' do
      allow(van).to receive_message_chain(:back_of_van, :delete_at).and_return(bike)
      expect(subject.unload_from_van(van)).to eq [bike]
    end
  end

  describe '#fix_bikes' do
    it 'fixes bikes' do
      allow(bike).to receive(:condition=).with("working")
      subject.broken_bikes[0] = bike
      subject.fix_bikes(bike)
      expect(subject.fixed_bikes[0]).to eq bike
    end
  end

end
