# Inspired by the work CTM Davies' research, as discussed by the Strava
# blog: http://engineering.strava.com/improving-grade-adjusted-pace/
module Stressfactor
  class GradeAdjustedPaceStrategy < PaceStrategy
    def self.calculate_for_interval(interval)
      interval.time(units: :minutes) / interval.distance
    end

    def calculate(units: :meters)
      intervals.inject(0) do |acc, interval|
        weighted_interval = (interval.distance / total_distance) * self.class.calculate_for_interval(interval)
        acc + weighted_interval
      end
    end

    private

    def self.calculate_for_interval(interval)
      observed_pace = interval.time(units: :minutes) / interval.distance
      coefficient_per_grade_point = 0.033
      grade = interval.grade

      puts interval

      observed_pace / (1 + (coefficient_per_grade_point * grade))
    end

    # The effect of the incline/grade on performance.
    # CTM Davies says that every 1% is 3.3% negative effect on performance.
    def grade_coefficient(interval)
      1.0
    end
  end
end
