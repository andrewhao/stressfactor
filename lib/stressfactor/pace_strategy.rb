# Abstract base class for pace strategies.
module Stressfactor
  class PaceStrategy
    attr_reader :intervals

    def initialize(intervals)
      @intervals = intervals
    end

    # Total elapsed time in minutes
    def total_distance
      @total_distance ||= intervals.inject(0) do |acc, interval|
        acc + interval.distance
      end
    end
  end
end
