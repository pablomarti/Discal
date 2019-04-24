class Discal
  attr_reader :coords

  def initialize(coords)
    @coords = coords

    raise ArgumentError, 'Argument is not an Array' unless coords.is_a? Array
    raise ArgumentError, 'Argument must contain 2 coordinates' unless coords.count == 2
    raise ArgumentError, 'Point 1 is not an Array' unless coords[0].is_a? Array
    raise ArgumentError, 'Point 2 is not an Array' unless coords[1].is_a? Array
    raise ArgumentError, 'Point 1 must be: (lat, lng)' unless coords[0].count == 2
    raise ArgumentError, 'Point 2 must be: (lat, lng)' unless coords[1].count == 2
  end

  def calculate_distance_with_math
    Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
  end

  def calculate_distance_with_api
    "y"
  end

  private

  def x1
    point1[0]
  end

  def x2
    point2[0]
  end

  def y1
    point1[1]
  end

  def y2
    point2[1]
  end

  def point1
    coords[0]
  end

  def point2
    coords[1]
  end
end
