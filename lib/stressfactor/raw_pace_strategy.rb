# Take the exact average over all paces over the set of
# run intervals.
module Stressfactor
  class RawPaceStrategy < PaceStrategy
    def calculate
      intervals.inject(0) do |acc, interval|
        weighted_interval = (interval.distance / total_distance) * (interval.time(units: :minutes) / interval.distance)
        acc + weighted_interval
      end
    end
  end
end
