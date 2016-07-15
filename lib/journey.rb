class Journey
attr_reader :journey_history
PENALTY_FARE = 6

  def initialize(entry_station: nil)
    @journey_history =  entry_station
    @complete = false
  end

  def complete?
    @complete
  end

  def fare
    PENALTY_FARE
  end

  def finish(station = nil)
    @exit_station = station
    @complete = true
    self
  end

end
