require_relative 'journey'

class JourneyLog

attr_reader :journey, :entry_station, :history

  def initialize(journey = Journey.new)
    @journey = journey
  end

  def start(entry_station)
    @entry_station
  end

  def current_journey
    @journey ||= Journey.new
  end

end
