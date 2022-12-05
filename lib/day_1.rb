require_relative "./aoc"

class Day1 < AOC
  def solve(part:)
    data = lazy_load_data.map(&:to_i)

    max = count(data)

    return max.sort.reverse[0] if part == 1

    max.sort.reverse.first(3).sum
  end

  def count(data)
    sum = []
    temp_sum = 0
    data.each do |line|
      if line.to_i.zero?
        sum.push(temp_sum)
        temp_sum = 0
      else
        temp_sum += line.to_i
      end
    end
    sum
  end
end
