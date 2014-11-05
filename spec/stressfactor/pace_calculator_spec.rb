require "spec_helper"

describe Stressfactor::PaceCalculator do
  let(:gpx) { GPX::GPXFile.new }
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

  subject { described_class.new(gpx) }

  before do
    stub_track = double(:track, :points => points)
    allow(gpx).to receive(:tracks).and_return([stub_track])
  end

  describe "#calculate" do
    it "returns the standard (raw) pace without elevation data in minutes/km" do
      pace = subject.calculate(strategy: :raw)
      expected_pace = 9.643387311498394
      expect(pace).to eq(expected_pace)
    end

    context "with grade adjusted pace" do
      it "returns the GAP using the GAP calculator" do
        expected_gap_pace = 10
        expect_any_instance_of(Stressfactor::GradeAdjustedPaceStrategy).to \
          receive(:calculate).and_return(expected_gap_pace)
        pace = subject.calculate(strategy: :grade_adjusted)
        expect(pace).to eq expected_gap_pace
      end
    end
  end
end
