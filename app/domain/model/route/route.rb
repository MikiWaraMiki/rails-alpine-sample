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

    @src_station = src_station
    @dest_station = dest_station
  end
end
