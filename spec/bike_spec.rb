require 'bike'

describe Bike do
  it 'starts off in working condition' do
    expect(subject.condition).to eq 'working'
  end
  it 'can be in a broken state' do
    subject.report_broken
    expect(subject.condition).to eq 'broken'
  end
end
