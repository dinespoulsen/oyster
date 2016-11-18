#holds information about a station
class Station
DEFAULT_NAME = "station"
DEFAULT_ZONE = 1
attr_reader :name, :zone

  def initialize(name = DEFAULT_NAME, zone = DEFAULT_ZONE)
    @name = name
    @zone = zone
  end

end
