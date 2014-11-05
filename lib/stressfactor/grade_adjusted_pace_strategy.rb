# Inspired by the work CTM Davies' research, as discussed by the Strava
# blog: http://engineering.strava.com/improving-grade-adjusted-pace/
module Stressfactor
  class GradeAdjustedPaceStrategy < PaceStrategy
    def initialize(intervals)
      @intervals = intervals
    end

    def calculate
      intervals.inject(0) do |acc, interval|
        weighted_interval = (interval.distance / total_distance) * \
          grade_coefficient(interval) * \
          (interval.time(units: :minutes) / interval.distance)
        acc + weighted_interval
      end
    end

    # The effect of the incline/grade on performance.
    # CTM Davies says that every 1% is 3.3% negative effect on performance.
    def grade_coefficient(interval)
      1.0
    end
  end
end
