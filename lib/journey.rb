class Journey

  attr_reader :entry_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def finish
    true
  end

private
  def in_journey?
    @entry_station != nil ? true : false
  end

end