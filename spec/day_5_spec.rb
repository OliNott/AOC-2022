require "day_5"

RSpec.describe Day5 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day5.txt" }
  let(:part) { 1 }

  context "part one" do
    it { is_expected.to eq('CMZ') }
  end

  context "part two" do
      let(:part) { 2 }
      it { is_expected.to eq('MCD') }
  end
end
