require "day_4"

RSpec.describe Day4 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day4.txt" }
  let(:part) { 1 }

  context "part one" do
    it { is_expected.to eq(2) }
  end

  context "part two" do
      let(:part) { 2 }
      it { is_expected.to eq(4) }
  end
end
