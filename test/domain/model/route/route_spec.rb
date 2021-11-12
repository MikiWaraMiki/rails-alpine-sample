require 'rails_helper'

RSpec.describe Model::Route::Route, type: :model do
  describe 'initialize' do

    context '出発駅がnilの場合' do
      it 'エラーが発生する' do
        src_station = Model::Station::Station.new('tokyo')
        dest_station = nil

        expect { Model::Route::Route.new(src_station, dest_station)}.to raise_error(ArgumentError)
      end
    end

    context '到着駅がnilの場合' do
      it 'エラーが発生する' do
        dest_station = nil
        src_station = Model::Station::Station.new('tokyo')

        expect {Model::Route::Route.new(src_station, dest_station)}.to raise_error(ArgumentError)
      end
    end

    context '出発駅と到着駅が両方とも入力されている場合' do
      it 'エラーが発生しない' do
        src_station = Model::Station::Station.new('tokyo')
        dest_station = Model::Station::Station.new('shin_osaka')

        expect {Model::Route::Route.new(src_station, dest_station)}.not_to raise_error(ArgumentError)
      end
    end

    # TODO: 実装
    context '出発駅と到着駅が同じ場合' do
      it 'エラーが発生しない' do
        src_station = Model::Station::Station.new('tokyo')
        dest_station = Model::Station::Station.new('tokyo')

        expect { Model::Route::Route.new(src_station, dest_station) }.to raise_error(ArgumentError)
      end
    end
  end
end
