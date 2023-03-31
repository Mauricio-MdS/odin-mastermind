# frozen_string_literal: true

# Computer moves when role not played by human
class ArtificialIntelligence
  def initialize
    @possible_codes = generate_possible_codes
  end

  def analyze_hits(guess, hits)
    # Select only the possible codes that result in the same number of hits
    @possible_codes.select! do |code|
      code_hits = 0
      code.each_index do |i|
        code_hits += 1 if code[i] == guess[i]
      end
      code_hits == hits.first
    end
  end

  def provide_code
    @possible_codes.sample
  end

  def provide_guess
    guess = provide_code
    puts "Computer tries #{guess.join('')}"
    guess
  end

  private

  def generate_possible_codes
    # Generate all possible codes with numbers from 1 to 6
    (1..6).to_a.repeated_permutation(4).to_a
  end
end
