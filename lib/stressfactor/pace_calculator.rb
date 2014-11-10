require "ostruct"

module Stressfactor
  class PaceCalculator
    attr_accessor :gpx_loader

    def initialize(gpx_loader)
      @gpx_loader = gpx_loader
    end

    def calculate(strategy: :grade_adjusted, units: :metric)
      pace = AveragePaceAccumulator.new(intervals).average_pace(strategy: strategy)
      pace *= (1/0.621371) if units == :english
      pace
    end

    private

    def intervals
      gpx_loader.intervals
    end
  end
end

