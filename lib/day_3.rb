require_relative "./aoc"

class Day3 < AOC

  PRIORITY = ('a' .. 'z').to_a + ('A' .. 'Z').to_a

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
    total = 0
    @data.each do |bag|
      first, second = bag.split('').each_slice(bag.size / 2).to_a

      common = second & first

      priority = PRIORITY.find_index(common[0])
      total += (priority + 1) unless priority.nil?
    end
    total
  end

  def solve_2
    total = 0
    @data.each_slice(3).each do |bag|
      common = bag[0].split('') & bag[1].split('') & bag[2].split('')
      priority = PRIORITY.find_index(common[0])
      total += (priority + 1) unless priority.nil?
    end
    total
  end
end
