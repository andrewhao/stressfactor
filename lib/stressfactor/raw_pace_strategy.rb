# Take the exact average over all paces over the set of
# run intervals.
module Stressfactor
  class RawPaceStrategy < PaceStrategy

    def self.calculate_for_interval(interval)
      interval.time(units: :minutes) / interval.distance
    end

    def calculate
      intervals.inject(0) do |acc, interval|
        weighted_interval = (interval.distance / total_distance) * self.class.calculate_for_interval(interval)
        acc + weighted_interval
      end
    end
  end
end
