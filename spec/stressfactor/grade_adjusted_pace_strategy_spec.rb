require "spec_helper"

describe Stressfactor::GradeAdjustedPaceStrategy do
  let(:intervals) { [p1, p2] }
  subject { described_class.new(intervals) }
end
