require "ostruct"

module Stressfactor
  class PaceCalculator
    attr_accessor :gpx

    def initialize(gpx)
      @gpx = gpx
    end

    def calculate(strategy: :grade_adjusted, units: :metric)
      pace = AveragePaceAccumulator.new(point_intervals).average_pace(strategy: strategy)
      pace *= (1/0.621371) if units == :english
      pace
    end

    private

    # An array of instantaneous pace times in min/km from comparing
    # two trackpoints
    def point_intervals
      @point_intervals ||= begin
        points.map do |p1|
          idx = points.index(p1)
          p2 = points[idx+1]

          if p2
            Interval.new(p1, p2)
          else
            nil
          end
        end
      end
      @point_intervals.compact
    end

    # An array of GPX::TrackPoint objects.
    def points
      @points ||= gpx.tracks.flat_map(&:points)
    end
  end
end
