class Model::Route::Route

  attr_reader :src_station
  attr_reader :dest_station

  def initialize(src_station, dest_station)
    if src_station.nil?
      raise ArgumentError.new('出発駅が入力されていません。')
    end

    if dest_station.nil?
      raise ArgumentError.new('到着駅が入力されていません。')
    end

    if src_station == dest_station
      raise ArgumentError.new('出発駅と到着駅を同じにすることはできません。')
    end

    @src_station = src_station
    @dest_station = dest_station
  end

  # return Boolean(true or false)
  def ==(route)
    return false unless route.class == Model::Route::Route

    src_station == route.src_station &&
      dest_station == route.dest_station
  end

end
