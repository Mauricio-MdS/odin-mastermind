# frozen_string_literal: true

require_relative './breaker'
require_relative './coder'

# Plays the mastermind game
class Mastermind
  INITIAL_INSTRUCTIONS = "\nMastermind is a game where the CODER plays agains the BREAKER.
The CODER selects a code composed of 4 algarisms between 1 and 6.
The BREAKER has 12 tries to decipher the code.
After each try, the BREAKER will know how many algarisms were written in the right position
and how many algarisms are in the wrong position.
You will play agains the computer.\n\n"

  def initialize
    puts INITIAL_INSTRUCTIONS
    option = 0
    until option.between?(1, 2)
      puts 'Press 1 to be the BREAKER.'
      puts 'Press 2 to be the CODER.'
      option = gets.to_i
    end
    @breaker = Breaker.new(option)
    @coder = Coder.new(option)
  end

  def play
  end
end
