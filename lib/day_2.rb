require_relative "./aoc"

class Day2 < AOC
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
    elf_game = ['A', 'B', 'C']
    my_game  = ['X', 'Y', 'Z']
    score = 0
    @data.each do |game|
      hands     = game.split(' ')
      elf_hand  = elf_game.find_index(hands[0])
      my_hand   = my_game.find_index(hands[1])
      score += 6 and p 'WIN'  if my_hand == (elf_hand + 1) || (my_hand + 2) == elf_hand
      score += 3 and p 'DRAW' if my_hand == elf_hand
      score += my_hand + 1
    end
    score
  end

  def solve_2
    elf_game = ['A', 'B', 'C']
    score = 0
    @data.each do |game|
      hands     = game.split(' ')
      elf_hand  = elf_game.find_index(hands[0]) + 1
      p hands
      if hands[1] == 'Y' # DRAW
        p 'DRAW'
        score += elf_hand
        score += 3
      elsif hands[1] == 'Z' # WIN
        p 'WIN'
        score += elf_hand + 1 if elf_hand < 3
        score += 1 if elf_hand == 3
        score += 6
      else # LOSE
        p 'LOSS'
        score += 3 if elf_hand == 1
        score += 1 if elf_hand == 2
        score += 2 if elf_hand == 3
      end
      p score
    end
    score
  end


end
