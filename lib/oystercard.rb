require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :journey, :journey_history
  MAXIMUM_CAPACITY = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_CAPACITY} exceeded" if max_balance?(money)
    @balance += money
  end

  def touch_in(entry_station)
    fail "Not enough funds" if not_enough?
    ## check if there is a previous journey by checking the journey history array
    ## check if previous journey is incomplete & if incomplete push to history
    if !@journey_history.empty? && (@new_journey.journey_hash[:in] != nil && @new_journey.journey_hash[:out] == nil)
    @journey_history << @new_journey.journey_hash
    end
    ## charge penalty fare

    #fail 'Oyster already touched in' if @new_journey.in_journey?
    new_journey
    @new_journey.add_entry_station(entry_station)
  end

  def touch_out(exit_station)
    #fail 'Oyster not touched in' if !in_journey?
    @new_journey.add_exit_station(exit_station)
    deduct
    @journey_history << @new_journey.journey_hash
    #@journey = {in: :nil, out: nil}
  end

  def new_journey
    @new_journey = Journey.new
    @new_journey
  end

  private

  def not_enough?
    @balance < MINIMUM_BALANCE
  end

  def max_balance?(money)
    balance + money > MAXIMUM_CAPACITY
  end

  def deduct
    @balance -= @new_journey.calculate_fare
  end

end
