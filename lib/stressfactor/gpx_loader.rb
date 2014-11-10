module Stressfactor
  class GpxLoader
    attr_reader :gpx

    def initialize(gpx_file_path)
      @gpx = GPX::GPXFile.new(gpx_file: gpx_file_path)
    end

    # units: seconds
    def total_time
      intervals.inject(0) do |acc, i|
        acc + i.time
      end
    end

    # An array of instantaneous pace times in min/km from comparing
    # two trackpoints
    def intervals
      @intervals ||= begin
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
      @intervals.compact
    end

    # An array of GPX::TrackPoint objects.
    def points
      @points ||= gpx.tracks.flat_map(&:points)
    end
  end
end
