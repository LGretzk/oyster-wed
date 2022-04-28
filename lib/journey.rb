class Journey

  attr_reader :entry_station, :exit_station, :journey_hash

  FARE = 1

  def initialize
    @journey_hash = {in: nil, out: nil}
  end 

  def add_entry_station(station)
    @journey_hash[:in] = station
  end

  def add_exit_station(station)
    @journey_hash[:out] = station
  end

  def in_journey?
    @journey_hash[:in] != nil && @journey_hash[:out] == nil
  end

  def calculate_fare
    return FARE if !in_journey?
  end

end 