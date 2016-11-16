class Journey
  attr_accessor :exit, :entry

  def initialize(entry)
    @entry = entry
    @exit = nil
  end

  def exit(station)
    self.exit = station
  end

end
