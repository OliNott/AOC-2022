require "day_6"

RSpec.describe Day6 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day6.txt" }
  let(:part) { 1 }

  context "part one" do
    it { is_expected.to eq(0) }
  end

  context "part two" do
      let(:part) { 2 }
      it { is_expected.to eq(0) }
  end
end
