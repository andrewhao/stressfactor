require "spec_helper"

describe Stressfactor::Interval do
  subject { described_class.new(p1, p2) }
  let(:t1) { Time.now }
  let(:t2) { t1 + 3 }
  let(:t3) { t1 + 6 }
  let(:p1) { GPX::TrackPoint.new(:time => t1, :lat => 0.00001, :lon => 0.00001, :elevation => 10) }
  let(:p2) { GPX::TrackPoint.new(:time => t2, :lat => 0.00002, :lon => 0.00002, :elevation => 15) }
  let(:p3) { GPX::TrackPoint.new(:time => t3, :elevation => 5) }

  describe "#time" do
    context "for adjacent points" do
      it "calculates the time between the two points" do
        expect(subject.time).to eq(3)
      end
    end

    it "calculates time in minutes" do
      expect(subject.time(units: :minutes)).to eq(0.05)
    end

    context "for a different set of points" do
      subject { described_class.new(p1, p3) }

      it "calculates the time between a second set of points" do
        expect(subject.time).to eq(6)
      end
    end
  end

  describe "#distance" do
    it "returns haversine distance from one point to the other" do
      expect(p2).to receive(:haversine_distance_from).with(p1).and_return(10)
      expect(subject.distance).to eq(10)
    end
  end

  describe "#grade" do
    it "returns the integer angle in radians of the elevation change" do
      expected_grade = 72.54128654632675
      expect(subject.grade).to eq(expected_grade)
    end
  end

  describe "#to_s" do
    it "returns a string with debug info" do
      expect(subject.to_s).to be_instance_of String
    end
  end
end
