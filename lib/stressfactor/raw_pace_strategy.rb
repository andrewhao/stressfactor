module Stressfactor
  class RawPaceStrategy
    attr_accessor :intervals, :total_distance
    def initialize(intervals, total_distance)
      @intervals = intervals
      @total_distance = total_distance
    end

    def calculate
      intervals.inject(0) do |acc, interval|
        weighted_interval = (interval.distance / total_distance) * (interval.time / interval.distance)
        acc + weighted_interval
      end
    end
  end
end
