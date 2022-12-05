Dir["./lib/*.rb"].sort.each { |f| require f }

namespace :aoc do
  # rake aoc:solve\[1,1\]
  task :solve, [:day, :part] do  |task, args|
    day_class = Object.const_get("Day#{args[:day]}")
    input_file = "data/day#{args[:day]}.txt"
    day = day_class.new(input_file: input_file)

    start = Time.now
    result = day.solve(part: args[:part].to_i)
    finish = Time.now
    time = finish - start
    puts "Result: #{result}"
    puts "Took: #{time}s"
  end

  # rake aoc:setup\[1\]
  task :setup, [:day] do |task, args|
      day           = args[:day].to_i
      day_class     = "Day#{day}"
      input_file    = "data/day#{day}.txt"
      fixture_file  = "spec/fixtures/day#{day}.txt"
      spec_file     = "spec/day_#{day}_spec.rb"
      lib_file      = "lib/day_#{day}.rb"

      File.open(input_file, "w")    { |f| f.write("") }
      File.open(fixture_file, "w")  { |f| f.write("") }
      File.open(spec_file, "w")     { |f| f.write(spec_template(day, day_class)) }
      File.open(lib_file, "w")      { |f| f.write(lib_template(day_class)) }
    end

    def spec_template(day, day_class)
      <<~SPEC
        require "day_#{day}"

        RSpec.describe #{day_class} do
          subject { day.solve(part: part) }

          let(:day) { described_class.new(input_file: input_file) }
          let(:input_file) { "spec/fixtures/day#{day}.txt" }
          let(:part) { 1 }

          context "part one" do
            it { is_expected.to eq(0) }
          end

          context "part two" do
              let(:part) { 2 }
              it { is_expected.to eq(0) }
          end
        end
      SPEC
    end

    def lib_template(day_class)
      <<~LIB
        require_relative "./aoc"

        class #{day_class} < AOC
          def solve(part:)
            @data = lazy_load_data

            case part
            when 1
              solve_1
            when 2
              solve_2
            end
          end

          def solve_1
            0
          end

          def solve_2
            0
          end
        end
      LIB
    end
end

