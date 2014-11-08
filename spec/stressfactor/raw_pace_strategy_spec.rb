require "spec_helper"

describe Stressfactor::RawPaceStrategy do
  let(:points) { [p1, p2, p3] }
  let(:end_time) { Time.now }
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

  let(:intervals) do
    [Stressfactor::Interval.new(p1, p2),
     Stressfactor::Interval.new(p2, p3)]
  end

  subject { described_class.new(intervals) }

  describe "#calculate" do
    it "returns the standard (raw) pace without elevation data in minutes/km" do
      pace = subject.calculate
      expected_pace = 9.643387311498394
      expect(pace).to eq(expected_pace)
    end
  end
end
