class Model::Station::Station
  TOKYO = 'tokyo'
  SHIN_OSAKA = 'shin_osaka'
  HIMEJI = 'himeji'

  STATION_LIST = {
    TOKYO => 'tokyo',
    SHIN_OSAKA => 'shin_osaka',
    HIMEJI => 'himeji'
  }

  attr_reader :name

  def initialize(station_name)
    if station_name == '' || station_name.nil?
      raise ArgumentError.new('駅名が入力されていません')
    end

    unless STATION_LIST.values.include?(station_name)
      raise ArgumentError.new('存在しない駅名です')
    end

    @name = station_name
  end

  def ==(other_object)
    return false if other_object.nil?

    other_object.class == self.class && other_object.name == name
  end

end
