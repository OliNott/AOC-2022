require_relative "./aoc"

class Day6 < AOC
  def solve(part:)
    @data = lazy_load_data

    case part
    when 1
      solve_1
    when 2
      solve_2
    end
  end

  SIGNAL_START_LENGTH = 4
  MESSAGE_LENGTH      = 14

  def solve_1
    # @data is an enumerator with all the lines from the input
    signal       = @data.first.chars
    signal_start = 0

    signal.each_with_index do |char, index|
      next if index < SIGNAL_START_LENGTH - 1

      if [signal[index - 3], signal[index - 2], signal[index - 1], char].uniq.size.eql?(SIGNAL_START_LENGTH)
        signal_start = index + 1 and break
      end
    end

    signal_start
  end

  def solve_2
    # @data is an enumerator with all the lines from the input
    signal        = @data.first.chars
    signal_start  = 0

    signal.each_with_index do |char, index|
      next if index < SIGNAL_START_LENGTH - 1

      if [signal[index - 3], signal[index - 2], signal[index - 1], char].uniq.size.eql?(SIGNAL_START_LENGTH)
        signal_start = index + 1 and break
      end
    end

    communication = signal.drop(signal_start)
    message_start = 0

    communication.each_with_index do |char, index|
      next if index < MESSAGE_LENGTH

      message = [char]
      MESSAGE_LENGTH.times do |n|
        message.unshift(communication[index - n])
      end

      message_start = signal_start + index + 1 and break if message.uniq.size.eql?(MESSAGE_LENGTH)
    end
    message_start
  end
end
