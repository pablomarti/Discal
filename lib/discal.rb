require 'haversine'
require 'net/http'
require 'uri'
require 'json'

class Discal
  attr_accessor :coords

  def initialize(coords)
    @coords = coords
    @cache = {}

    raise ArgumentError, 'Argument is not an Array' unless coords.is_a? Array
    raise RuntimeError, 'Min 2 coordinates' unless coords.count >= 2
    raise RuntimeError, 'Max 100 coordinates' unless coords.count <= 100
  end

  def calculate_distance_with_math
    loop_coordinates { |coord1, coord2|
      distance_math_function(coord1, coord2)
    }
  end

  def calculate_distance_with_api
    loop_coordinates { |coord1, coord2|
      api_call(coord1, coord2)
    }
  end

  protected

  def loop_coordinates
    coords.each_slice(2).map do |c|
      if cache = get_cache(c[0], c[1])
        results << cache
        next
      end

      result = yield(c[0], c[1])
      set_cache(c[0], c[1], result)

      result
    end
  end

  private

  def distance_math_function(coord1, coord2)
    Haversine.distance(coord1[0], coord1[1], coord2[0], coord2[1]).to_kilometers
  end

  def api_call(coord1, coord2)
    uri = URI.parse(url(coord1, coord2))
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)#
    json['resourceSets'][0]['resources'][0]['results'][0]['travelDistance']
  rescue SocketError
    raise SocketError, "Error while connecting to the API, please check the coordinates array"
  end

  def url(coord1, coord2)
    origins = "#{coord1[0]},#{coord1[1]}"
    destinations = "#{coord2[0]},#{coord2[1]}"
    base = 'https://dev.virtualearth.net/REST/v1/Routes/DistanceMatrix'
    "#{base}?origins=#{origins}&destinations=#{destinations}&travelMode=driving&distanceUnit=km&key=#{api_key}"
  end

  def api_key
    File.read('key.txt')
  rescue Errno::ENOENT
    raise Errno::ENOENT, "There is no file key.txt with key for Bing Maps"
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
