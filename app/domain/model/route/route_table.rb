class Model::Route::RouteTable

  def initialize()
    @table = [
      Model::Route::Route.new(
        Model::Station::Station.new('tokyo'),
        Model::Station::Station.new('shin_osaka')
      )
    ].freeze
  end


  def include?(route)
    @table.include?(route) # obj == route
  end

  private
  attr_reader :table
end
