require 'rails_helper'

RSpec.describe Model::Route::RouteTable, type: :model do

  describe 'include?' do
    context '存在する経路の場合' do
      it 'trueを返す' do
        table = Model::Route::RouteTable.new()

        route = Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('shin_osaka')
        )

        expect(table.include?(route)).to be_truthy
      end
    end

    context '存在しない経路の場合' do
      it 'falseを返す' do
        table = Model::Route::RouteTable.new()

        route = Model::Route::Route.new(
          Model::Station::Station.new('shin_osaka'),
          Model::Station::Station.new('tokyo')
        )

        expect(table.include?(route)).to be_falsey
      end
    end
  end
end
