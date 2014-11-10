require "spec_helper"

describe Stressfactor::GpxLoader do
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

  let(:path) { "path/to/gpx.gpx" }
  let(:points) { [p1, p2, p3] }
  let(:gpx) { double("gpx") }
  let(:track) { double("track", points: points) }
  subject { Stressfactor::GpxLoader.new(path) }

  before do
    expect(GPX::GPXFile).to receive(:new).and_return(gpx)
    expect(gpx).to receive(:tracks).and_return([track])
  end

  describe "#intervals" do
    it "returns two intervals" do
      expect(subject.intervals).to be_all{|i| i.is_a?(Stressfactor::Interval)}
    end
  end
end
