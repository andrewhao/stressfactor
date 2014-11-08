# Abstract base class for pace strategies.
module Stressfactor
  class PaceStrategy
    attr_reader :intervals

    def initialize(intervals)
      @intervals = intervals
    end

  end
end
