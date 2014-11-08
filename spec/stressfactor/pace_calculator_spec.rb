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
      expected_pace = 9.643387311498394
      pace = subject.calculate(strategy: :raw, units: :metric)
      expect(pace).to eq(expected_pace)
    end

    context "with grade adjusted pace" do
      it "returns the GAP using the GAP calculator" do
        expected_gap_pace = 9.251827552862885
        pace = subject.calculate(strategy: :grade_adjusted, units: :metric)
        expect(pace).to eq expected_gap_pace
      end
    end

    context "with english metrics" do
      it "returns raw pace in min/mi" do
        expected_pace = 15.519532310806898
        pace = subject.calculate(strategy: :raw, units: :english)
        expect(pace).to eq expected_pace
      end

      it "returns GAP pace in min/mi" do
        expected_pace = 14.889377767650702
        pace = subject.calculate(strategy: :grade_adjusted, units: :english)
        expect(pace).to eq expected_pace
      end
    end
  end
end
