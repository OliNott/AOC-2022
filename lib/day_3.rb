require_relative "./aoc"

class Day3 < AOC

  PRIORITY = ('a' .. 'z').to_a + ('A' .. 'Z').to_a

  def in_groups(array, number)
    group_size = array.size / number
    leftovers = array.size % number

    groups = []
    start = 0
    number.times do |index|
      length = group_size + (leftovers > 0 && leftovers > index ? 1 : 0)
      groups << array.slice(start, length)
      start += length
    end

    groups
  end

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
      grouped = bag.split('').each_slice(bag.size / 2).to_a
      first = grouped[0]
      second = grouped[1]

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
