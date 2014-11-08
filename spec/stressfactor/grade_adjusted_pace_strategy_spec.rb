require "spec_helper"

describe Stressfactor::GradeAdjustedPaceStrategy do
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
    [interval]
  end

  let(:interval) { Stressfactor::Interval.new(p1, p2) }

  subject { described_class.new(intervals) }

  describe ".calculate_for_interval" do
    subject { described_class.calculate_for_interval(interval) }

    it "compensates for the negative coefficient of 3.3% for every 1% incline" do
      expected_pace = 18.100632981302162
      expect(subject).to eq expected_pace
    end

    context "for declines" do
      let(:interval) { Stressfactor::Interval.new(p2, p3) }

      it "compensates for the positive coefficient of 1.815% for every 1% decline" do
        expected_pace = 2.459421791214623
        expect(subject).to eq expected_pace
      end
    end
  end
end
