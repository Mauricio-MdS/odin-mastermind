# frozen_string_literal: true

require_relative './artificial_intelligence'
require_relative './breaker'
require_relative './coder'
require_relative './player_interface'

# Plays the mastermind game
class Mastermind
  INITIAL_INSTRUCTIONS = "\nMastermind is a game where the CODER plays agains the BREAKER.
The CODER selects a code composed of 4 algarisms between 1 and 6.
The BREAKER has 12 tries to decipher the code.
After each try, the BREAKER will know how many algarisms were written in the right position
and how many algarisms are in the wrong position.
You will play agains the computer.\n\n"
  MAX_TRIES = 12

  def define_breaker_and_coder
    option = 0
    until option.between?(1, 2)
      puts 'Press 1 to be the BREAKER.'
      puts 'Press 2 to be the CODER.'
      option = gets.to_i
    end
    option
  end

  def out_of_tries?
    @tries += 1
    if @tries == MAX_TRIES
      puts 'GAME OVER! CODER wins. BREAKER reached the maximun number of tries.'
      return true
    end
    false
  end

  def play
    setup_game
    play_round until @end_game
  end

  def play_round
    guess = @breaker.provide_guess
    hits = @coder.check_guess!(guess)
    @end_game = victory?(hits) || out_of_tries?
  end

  def setup_game
    puts INITIAL_INSTRUCTIONS
    option = define_breaker_and_coder
    player_interface = PlayerInterface.new
    ai = ArtificialIntelligence.new
    @breaker = option == 1 ? Breaker.new(player_interface) : Breaker.new(ai)
    @coder = option == 1 ? Coder.new(ai) : Coder.new(player_interface)
    @end_game = false
    @tries = 0
  end

  def victory?(hits)
    return false unless hits == [4, 0]

    puts "It's a match! BREAKER wins!"
    true
  end
end
