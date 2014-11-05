require "spec_helper"

describe Stressfactor::GradeAdjustedPaceStrategy do
  let(:p1) do
    GPX::TrackPoint.new(
      :lat => 37.7985474,
      :lon => -122.2554386,
      :elevation => 10.0,
      :time => end_time - 10
    )
  end
  let(:p2) do
    GPX::TrackPoint.new(
      :lat => 37.7985583,
      :lon => -122.2554564,
      :elevation => 15.0,
      :time => end_time - 3
    )
  end
  let(:p3) do
    GPX::TrackPoint.new(
      :lat => 37.7986548,
      :lon => -122.2555806,
      :elevation => 10.0,
      :time => end_time
    )
  end
  let(:intervals) { [p1, p2] }
  subject { described_class.new(intervals) }

  describe "#calculate" do
  end
end
