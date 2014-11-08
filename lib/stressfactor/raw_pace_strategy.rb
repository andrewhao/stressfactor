# Take the exact average over all paces over the set of
# run intervals.
module Stressfactor
  class RawPaceStrategy < PaceStrategy

    def self.calculate_for_interval(interval)
      interval.time(units: :minutes) / interval.distance
    end

    def calculate
      AveragePaceAccumulator.new(intervals).average_pace(strategy: :raw)
    end
  end
end
