require 'discal'

RSpec.describe Discal do
  describe 'initialize' do
    it { expect { Discal.new(nil) }.to raise_error(ArgumentError, 'Argument is not an Array') }
  end

  x1 = 2.78788
  x2 = 3.6565
  x3 = 7.6565
  y1 = 3.578787
  y2 = 55.6434
  y3 = 57.6434
  coordinates = [[x1, y1], [x2, y2], [x3, y3], [x2, y2]]
  d1 = Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
  d2 = Math.sqrt((x3 - x1) ** 2 + (y3 - y1) ** 2)
  d3 = Math.sqrt((x3 - x2) ** 2 + (y3 - y2) ** 2)
  d4 = Math.sqrt((x2 - x2) ** 2 + (y2 - y2) ** 2)

  describe '#calculate_distance_with_math' do
    d = Discal.new(coordinates)
    it 'calculates' do
      expect(d.calculate_distance_with_math).to eq [d1, d2, d1, d3, d4, d3]
    end
  end

  describe '#calculate_distance_with_api' do
    d = Discal.new(coordinates)
    it 'calculates' do
      expect(d.calculate_distance_with_api).to eq 'y'
    end
  end
end
