require 'discal'

RSpec.describe Discal do
  describe 'initialize' do
    it { expect { Discal.new(nil) }.to raise_error(ArgumentError, 'Argument is not an Array') }
    it { expect { Discal.new([1]) }.to raise_error(ArgumentError, 'Argument must contain 2 coordinates') }
    it { expect { Discal.new([1, 2]) }.to raise_error(ArgumentError, 'Point 1 is not an Array') }
    it { expect { Discal.new([[1], 2]) }.to raise_error(ArgumentError, 'Point 2 is not an Array') }
    it { expect { Discal.new([[1], [3]]) }.to raise_error(ArgumentError, 'Point 1 must be: (lat, lng)') }
    it { expect { Discal.new([[1, 2], [3]]) }.to raise_error(ArgumentError, 'Point 2 must be: (lat, lng)') }
    it { expect { Discal.new([[1, 2], [3, 4]]) }.not_to raise_error }
  end

  coordinates = [[2.78788, 3.578787], [3.6565, 55.6434]]
  distance = Math.sqrt((3.6565 - 2.78788) ** 2 + (55.6434 - 3.578787) ** 2)

  describe '#calculate_distance_with_math' do
    d = Discal.new(coordinates)
    it 'calculates' do
      expect(d.calculate_distance_with_math).to eq distance
    end
  end

  describe '#calculate_distance_with_api' do
    d = Discal.new(coordinates)
    it 'calculates' do
      expect(d.calculate_distance_with_api).to eq 'y'
    end
  end
end
