require './lib/renter'
require './lib/boat'

class Dock
  attr_reader :name, :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log.store(boat, renter)
  end

  def charge(boat)
    charge = {}
    if boat.hours_rented > @max_rental_time
      boat.hours_rented = @max_rental_time
    end 
    fee = boat.hours_rented * boat.price_per_hour
    charge.store(:card_number, @rental_log[boat].credit_card_number)
    charge.store(:amount, fee)
    charge
  end

end
