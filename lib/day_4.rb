require_relative "./aoc"

class Day4 < AOC
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
    @data.each do |line|
      sections = line.split(',').map { |l| l.split('-') }
      section1 = (sections[0][0].to_i..sections[0][1].to_i).to_a
      section2 = (sections[1][0].to_i..sections[1][1].to_i).to_a
      total += 1 if (section1 - section2).empty? || (section2 - section1).empty?
    end
    total
  end

  def solve_2
    total = 0
    @data.each do |line|
      sections = line.split(',').map { |l| l.split('-') }
      section1 = (sections[0][0].to_i..sections[0][1].to_i).to_a
      section2 = (sections[1][0].to_i..sections[1][1].to_i).to_a
      total += 1 if (section1 & section2).any? || (section2 & section1).any?
    end
    total
  end
end
