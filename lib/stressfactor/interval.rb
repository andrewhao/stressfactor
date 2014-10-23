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

    end
  end
end
