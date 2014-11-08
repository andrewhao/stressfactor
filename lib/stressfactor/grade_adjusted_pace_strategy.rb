# Inspired by the work CTM Davies' research, as discussed by the Strava
# blog: http://engineering.strava.com/improving-grade-adjusted-pace/
module Stressfactor
  class GradeAdjustedPaceStrategy < PaceStrategy
    attr_accessor :interval

    def self.calculate_for_interval(interval)
      observed_pace = interval.time(units: :minutes) / interval.distance
      interval.grade > 0 ? incline_pace(interval, observed_pace) : decline_pace(interval, observed_pace)
    end

    def self.decline_pace(interval, observed_pace)
      coefficient_per_grade_point = 0.01815
      grade = interval.grade
      observed_pace / (1 - (coefficient_per_grade_point * grade))
    end

    def self.incline_pace(interval, observed_pace)
      coefficient_per_grade_point = 0.033
      grade = interval.grade
      observed_pace / (1 + (coefficient_per_grade_point * grade))
    end
  end
end
