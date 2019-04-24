require 'discal'
require 'haversine'

RSpec.describe Discal do
  describe 'initialize' do
    it { expect { Discal.new(nil) }.to raise_error(ArgumentError, 'Argument is not an Array') }
    it { expect { Discal.new([1]) }.to raise_error(RuntimeError, 'Min 2 coordinates') }
    it { expect { Discal.new((1..101).to_a) }.to raise_error(RuntimeError, 'Max 100 coordinates') }
  end

  lat1 = 39.06546
  lat2 = 33.06546
  lat3 = 21.06546
  lng1 = -104.88544
  lng2 = -104.80
  lng3 = -103.80

  coordinates = [[lat1, lng1], [lat2, lng2], [lat3, lng3], [lat2, lng2]]
  
  d1 = Haversine.distance(lat1, lng1, lat2, lng2).to_kilometers
  d2 = Haversine.distance(lat1, lng1, lat3, lng3).to_kilometers
  d3 = Haversine.distance(lat2, lng2, lat3, lng3).to_kilometers
  d4 = Haversine.distance(lat2, lng2, lat2, lng2).to_kilometers

  describe '#calculate_distance_with_math' do
    d = Discal.new(coordinates)
    it 'calculates' do
      expect(d.calculate_distance_with_math).to eq [d1, d2, d1, d3, d4, d3]
    end
  end

  describe '#calculate_distance_with_api' do
    d = Discal.new(coordinates)
    it 'calculates' do
      expect(d.calculate_distance_with_api.count).to eq 6
    end
  end
end
