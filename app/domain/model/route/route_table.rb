class Model::Route::RouteTable

  def initialize()
    @table = [
      { route: 'aaaaa', }
    ]
  end

  private
  attr_reader :table
end
