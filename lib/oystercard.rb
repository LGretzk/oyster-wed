require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :journey, :journey_history
  
  MAXIMUM_CAPACITY = 90
  MINIMUM_BALANCE = 1
  FARE = 1

  def initialize
    @balance = 0
    #@journey = {in: nil, out: nil}
    @journey_history = []
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_CAPACITY} exceeded" if max_balance?(money)
    @balance += money
  end

  def touch_in(entry_station)
    fail "Not enough funds" if not_enough?
    #fail 'Oyster already touched in' if @new_journey.in_journey?
    #@journey[:in] = entry_station
    new_journey
    @new_journey.add_entry_station(entry_station)
  end

  def touch_out(exit_station)
    #fail 'Oyster not touched in' if !in_journey?
    deduct
    @new_journey.add_exit_station(exit_station)
    #@journey[:out] = exit_station 
    @journey_history << @new_journey.journey_hash
    #@journey = {in: :nil, out: nil}
  end

  # def in_journey?
  #   @journey[:in] != nil && @journey[:out] == nil
  # end

  def new_journey
    @new_journey = Journey.new
  end

  private




  def not_enough?
    @balance < MINIMUM_BALANCE
  end

  def max_balance?(money)
    balance + money > MAXIMUM_CAPACITY
  end

  def deduct
    @balance -= FARE
  end

end