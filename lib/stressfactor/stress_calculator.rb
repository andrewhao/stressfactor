# Implements the actual TSS algorithm.
module Stressfactor
  class StressCalculator
    attr_reader :threshold_pace, :loader

    def initialize(threshold_pace: threshold_pace, loader: loader)
      @threshold_pace = threshold_pace
      @loader = loader
    end

    def calculate
      (total_time * normalized_graded_pace * intensity_factor * 100) / (threshold_pace * 3600)
    end

    private

    def total_time
      loader.total_time
    end

    def intensity_factor
      normalized_graded_pace / threshold_pace
    end

    def normalized_graded_pace
      @normalized_graded_pace ||= PaceCalculator.new(loader).calculate(strategy: :grade_adjusted, units: :metric)
    end
  end
end
