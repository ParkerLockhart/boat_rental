require './lib/boat'
require './lib/renter'

describe Boat do
  it 'exists' do
    kayak = Boat.new(:kayak, 20)
    expect(kayak).to be_instance_of(Boat)
  end

  it 'has a type' do
    kayak = Boat.new(:kayak, 20)
    expect(kayak.type).to eq(:kayak)
  end

  it 'has a price_per_hour' do
    kayak = Boat.new(:kayak, 20)
    expect(kayak.price_per_hour).to eq(20)
  end

  it 'has hours_rented' do
    kayak = Boat.new(:kayak, 20)
    expect(kayak.hours_rented).to eq(0)
  end

  describe 'Methods' do
    it '#add_hour' do
      kayak = Boat.new(:kayak, 20)
      kayak.add_hour
      expect(kayak.hours_rented).to eq(1)
    end
  end 
end
