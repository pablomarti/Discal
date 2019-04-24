class Discal
  attr_accessor :coords

  def initialize(coords)
    @coords = coords
    @cache = {}

    raise ArgumentError, 'Argument is not an Array' unless coords.is_a? Array
  end

  def calculate_distance_with_math
    results = []
    
    coords.each_with_index do |coord1, i|
      for j in (i+1)...(coords.count)
        coord2 = coords[j]

        cache = get_cache(coord1, coord2)
        if cache
          results << cache
          next
        end
        
        result = distance_math_function(coord1, coord2)
        results << result
        set_cache(coord1, coord2, result)
      end
    end

    results
  end

  def calculate_distance_with_api
    "y"
  end

  private

  def distance_math_function(coord1, coord2)
    Math.sqrt((coord2[0] - coord1[0]) ** 2 + (coord2[1] - coord1[1]) ** 2)
  end

  def get_cache(coord1, coord2)
    r = @cache.dig("#{coord1[0]},#{coord1[1]}", "#{coord2[0]},#{coord2[1]}")
    r ||= @cache.dig("#{coord2[0]},#{coord2[1]}", "#{coord1[0]},#{coord1[1]}")
  end

  def set_cache(coord1, coord2, value)
    @cache["#{coord1[0]},#{coord1[1]}"] ||= {}
    @cache["#{coord1[0]},#{coord1[1]}"]["#{coord2[0]},#{coord2[1]}"] = value
  end
end
