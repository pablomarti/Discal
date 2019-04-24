require 'discal'

RSpec.describe Discal do
  describe '#calculate_distance_with_math' do
    d = Discal.new([[1, 2], [3, 4]])
    it 'calculates' do
      expect(d.calculate_distance_with_math).to eq 'x'
    end
  end

  describe '#calculate_distance_with_api' do
    d = Discal.new([[1, 2], [3, 4]])
    it 'calculates' do
      expect(d.calculate_distance_with_api).to eq 'y'
    end
  end
end
