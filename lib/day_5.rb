require_relative "./aoc"

class Day5 < AOC
  def solve(part:)
    @data = lazy_load_data

    case part
    when 1
      solve_1
    when 2
      solve_2
    end
  end

  CRATE_VALUE = 9 # Height of columns. 3 for the tests, 9 for the input

  def solve_1
    crate_mover 9000
  end

  def solve_2
    crate_mover 9001
  end

  def crate_mover(crate_mover_version)
    crates = []
    CRATE_VALUE.times { crates.push([]) }

    # @data is an enumerator with all the lines from the input
    @data.each_with_index do |line, index|
      if index < CRATE_VALUE
        CRATE_VALUE.times do |key|
          box = line[(key * 4) + 1]
          next if box.nil? || box.strip.empty?

          crates[key].push(box)
        end
      elsif line.include?('move')
        nb, from, to = line.scan(/\d+/).map(&:to_i)
        moved = crates[from - 1].shift(nb).reverse
        moved.each { |box| crates[to - 1].unshift(box) }
      end
    end
    crates.map(&:first).join('')
  end
end
