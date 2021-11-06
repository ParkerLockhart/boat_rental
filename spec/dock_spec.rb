require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    @kayak_1.add_hour
    @kayak_1.add_hour
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

  describe '#rent' do
    it 'returns a hash of boat key with renter value' do
      @dock.rent(@kayak_1, @patrick)
      expect(@dock.rental_log).to eq({@kayak_1 => @patrick})
    end
  end

  describe '#charge' do
    it 'returns a hash of card number and amount' do
      @dock.rent(@kayak_1, @patrick)
      expect(@dock.charge(@kayak_1)).to eq({:card_number => "4242424242424242", :amount => 40})
    end

    it 'doesnt charge more than max hours rented' do
      @dock.rent(@sup_1, @eugene)
      @sup_1.add_hour
      @sup_1.add_hour
      @sup_1.add_hour
      @sup_1.add_hour
      @sup_1.add_hour
      expect(@dock.charge(@sup_1)).to eq({:card_number => "1313131313131313", :amount => 45})
    end 
  end
end
