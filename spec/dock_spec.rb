require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dock).to be_instance_of(Dock)
    end

    it 'has a name' do
      expect(@dock.name).to eq("The Rowing Dock")
    end

    it 'has a max rental time' do
      expect(@dock.max_rental_time).to eq(3)
    end 
  end
end
