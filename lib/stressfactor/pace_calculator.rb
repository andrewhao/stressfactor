require "ostruct"

module Stressfactor
  class PaceCalculator

    attr_accessor :gpx
    def initialize(gpx)
      @gpx = gpx
    end

    def calculate
      paces.inject(0) do |acc, pace|
        puts "total_distance: #{total_distance}"
        puts "pace: #{pace}"
        weighted_pace = (pace.distance / total_distance) * (pace.time / pace.distance)
        acc + weighted_pace
      end
    end

    private

    # Total elapsed time in minutes
    def total_distance
      @total_distance ||= paces.inject(0) do |acc, pace|
        acc + pace.distance
      end
    end

    # An array of instantaneous pace times in min/km from comparing
    # two trackpoints
    def paces
      paces = points.map do |p1|
        idx = points.index(p1)
        p2 = points[idx+1]

        if p2
          d1 = p1.haversine_distance_from(p2)
          t1 = (p2.time - p1.time) / 60.0

          os = OpenStruct.new(:time => t1, :distance => d1)
          puts os
          os
        else
          nil
        end
      end
      paces.compact
    end

    # An array of GPX::TrackPoint objects.
    def points
      @points ||= gpx.tracks.map(&:points).flatten
    end
  end
end
