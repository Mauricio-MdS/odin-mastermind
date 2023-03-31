# frozen_string_literal: true

# Player interface when role played by human
class PlayerInterface
  # Player must analyze hits on his own
  def analyze_hits(guess, hits) end

  def provide_code
    ask_for_code_input 'Choose a code in the format NNNN where N is 1 to 6'
  end

  def provide_guess
    ask_for_code_input 'What is the code? (NNNN where N is 1 to 6)'
  end

  private

  def ask_for_code_input(message)
    puts message
    code = gets.chomp.split('').map(&:to_i)
    until valid_code?(code)
      puts message
      code = gets.chomp.split('').map(&:to_i)
    end
    code
  end

  def valid_code?(code)
    return true if code.length == 4 && code.all? { |number| number.between?(1, 6) }

    puts 'Invalid input'
    false
  end
end
