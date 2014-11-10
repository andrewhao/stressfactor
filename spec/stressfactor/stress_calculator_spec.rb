require "spec_helper"

describe Stressfactor::StressCalculator do
  # use 5k pace
  # 19min / 5k = 3.8 m/km
  let(:threshold_pace) { 3.8 }
  let(:gpx) { "gpx file" }
  let(:normalized_graded_pace) { 3.0 }
  let(:total_time) { 3600 }
  let(:loader) { double('loader', :total_time => total_time) } #Stressfactor::GpxLoader.new(gpx) }
  subject { described_class.new(threshold_pace: threshold_pace, loader: loader) }

  describe "#calculate" do
    it "returns a number" do
      expect_any_instance_of(Stressfactor::PaceCalculator).to \
        receive(:calculate).with(strategy: :grade_adjusted, units: :metric).\
        and_return(normalized_graded_pace)
      expect(subject.calculate).to be_kind_of Numeric
    end

    it "returns the calculation" do
      expect_any_instance_of(Stressfactor::PaceCalculator).to \
        receive(:calculate).with(strategy: :grade_adjusted, units: :metric).\
        and_return(normalized_graded_pace)
      expect(loader).to \
        receive(:total_time).\
        at_least(1).\
        and_return(total_time)
      intensity_factor = normalized_graded_pace / threshold_pace
      expected_score = 62.326869806094194
      expect(subject.calculate).to eq expected_score
    end
  end
end
