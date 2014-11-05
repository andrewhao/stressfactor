module Stressfactor
  class Interval
    attr_accessor :start_point, :end_point

    def initialize(start_point, end_point)
      @start_point = start_point
      @end_point = end_point
    end

    # time in seconds
    def time(options={})
      delta = end_point.time - start_point.time
      delta /= 60.0 if options[:units] == :minutes
      delta
    end

    # distance in km
    def distance
      end_point.haversine_distance_from(start_point)
    end

    # grade in percent incline/decline
    def grade
      elevation_change = end_point.elevation - start_point.elevation
      # Normalize to meters
      distance_change = distance * 1000
      radians = Math.atan(elevation_change / distance_change)
      180 * radians / Math::PI
    end

    def to_s
      "i: #{time}s | #{distance * 1000}m | #{grade}%"
    end
  end
end
