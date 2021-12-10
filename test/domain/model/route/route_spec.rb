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

  describe '==の判定' do
    context '出発駅と到着駅が同じ場合' do
      let!(:route) {
        Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('shin_osaka')
        )
      }
      let!(:other_route) {
        Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('shin_osaka')
        )
      }

      it 'trueを返すこと' do
        expect(route).to eq other_route
      end
    end

    context '出発駅が異なる場合' do
      let!(:route) {
        Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('shin_osaka')
        )
      }
      let!(:other_route) {
        Model::Route::Route.new(
          Model::Station::Station.new('himeji'),
          Model::Station::Station.new('shin_osaka')
        )
      }

      it 'falseを返すこと' do
        expect(route).not_to eq other_route
      end
    end

    context '到着駅が異なる場合' do
      let!(:route) {
        Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('himeji')
        )
      }
      let!(:other_route) {
        Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('shin_osaka')
        )
      }

      it 'falseを返すこと' do
        expect(route).not_to eq other_route
      end
    end

    context '比較対象が経路オブジェクトではない場合' do
      let!(:route) {
        Model::Route::Route.new(
          Model::Station::Station.new('tokyo'),
          Model::Station::Station.new('himeji')
        )
      }

      it 'falseを返すこと' do
        expect(1).not_to eq route
        expect(nil).not_to eq route
      end
    end
  end
end
