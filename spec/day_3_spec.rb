require "day_3"

RSpec.describe Day3 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day3.txt" }
  let(:part) { 1 }

  context "part one" do
    it { is_expected.to eq(157) }
  end

  context "part two" do
      let(:part) { 2 }
      it { is_expected.to eq(70) }
  end
end
