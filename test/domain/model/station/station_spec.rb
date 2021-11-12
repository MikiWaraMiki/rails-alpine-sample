require 'rails_helper'


RSpec.describe Model::Station::Station, type: :model do
  describe 'initialize' do

    context '東京駅の場合' do
      it '例外が発生しないこと' do
        station = Model::Station::Station.new('tokyo')
        expect(station.name).to eq 'tokyo'
      end
    end

    context '新大阪駅の場合' do
      it '例外が発生しないこと' do
        station = Model::Station::Station.new('shin_osaka')
        expect(station.name).to eq 'shin_osaka'
      end
    end

    context '姫路駅の場合' do
      it '例外が発生しないこと' do
        station = Model::Station::Station.new('himeji')
        expect(station.name).to eq 'himeji'
      end
    end

    context '上記以外の駅の場合' do
      it '例外が発生すること' do
        expect do
          Model::Station::Station.new('yokohama')
        end.to raise_error('存在しない駅名です')
      end
    end

    context '駅名が未入力の場合' do
      it '例外が発生すること' do
        expect do
          Model::Station::Station.new('')
        end.to raise_error('駅名が入力されていません')
      end
    end
  end

  describe 'equals' do
    let!(:station) { Model::Station::Station.new('shin_osaka') }
    context 'nilを渡した場合' do
      it 'falseを返すこと' do
        expect(station == nil).to be_falsey
      end
    end

    context 'Station以外を渡した場合' do
      it 'falseを返すこと' do
        expect(station == 1).to be_falsey
      end
    end

    context '駅名が異なるStationを渡した場合' do
      it 'falseを返すこと' do
        other = Model::Station::Station.new('tokyo')
        expect(station == other).to be_falsey
      end
    end

    context '駅名が同じStationを渡した場合' do
      it 'trueを返すこと' do
        other = Model::Station::Station.new('shin_osaka')
        expect(station == other).to be_truthy
      end
    end
  end
end
