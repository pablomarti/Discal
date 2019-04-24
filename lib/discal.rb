class Discal
  attr_reader :coords

  def initialize(coords)
    @coords = coords
  end

  def calculate_distance_with_math
    "x"
  end

  def calculate_distance_with_api
    "y"
  end
end
