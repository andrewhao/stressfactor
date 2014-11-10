require "spec_helper"

describe Stressfactor::PaceCalculator do
  let(:gpx_loader) { double("loader", intervals: intervals) }
  let(:intervals) do
    [Stressfactor::Interval.new(p1, p2),
     Stressfactor::Interval.new(p2, p3)]
  end
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

  subject { described_class.new(gpx_loader) }

  describe "#calculate" do
    it "returns the standard (raw) pace without elevation data in minutes/km" do
      expected_pace = 9.643387311498394
      pace = subject.calculate(strategy: :raw, units: :metric)
      expect(pace).to eq(expected_pace)
    end

    context "with grade adjusted pace" do
      it "returns the GAP using the GAP calculator" do
        expected_gap_pace = 4.250092836947296
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
        expected_pace = 6.839863522673726
        pace = subject.calculate(strategy: :grade_adjusted, units: :english)
        expect(pace).to eq expected_pace
      end
    end
  end
end
