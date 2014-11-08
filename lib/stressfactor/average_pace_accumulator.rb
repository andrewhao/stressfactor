module Stressfactor
  class AveragePaceAccumulator
    attr_accessor :intervals

    def initialize(intervals)
      @intervals = intervals
    end

    def average_pace(strategy: :raw)
      strategy_klass = strategy == :raw ? RawPaceStrategy : GradeAdjustedPaceStrategy
      intervals.inject(0) do |acc, interval|
        weighted_interval = (interval.distance / total_distance) * strategy_klass.calculate_for_interval(interval)
        acc + weighted_interval
      end
    end
    private
    # Total elapsed time in minutes
    def total_distance
      @total_distance ||= intervals.inject(0) do |acc, interval|
        acc + interval.distance
      end
    end
  end
end
