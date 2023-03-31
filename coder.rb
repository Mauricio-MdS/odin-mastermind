# frozen_string_literal: true

# Coder moves
class Coder
  def initialize(brain)
    @brain = brain
    @code = provide_code
  end

  def check_guess!(guess)
    unbroken_code = @code.clone
    hits = []
    hits.push(calculate_precise_hits!(guess, unbroken_code))
    hits.push(calculate_out_of_order!(guess, unbroken_code))
    puts "\n#{hits.first} numbers on the right position."
    puts "#{hits.last} numbers out of order. \n\n"
    hits
  end

  private

  def calculate_out_of_order!(guess, code)
    hits = 0
    code.each_with_index do |number, index|
      index_at_guess = guess.find_index(number)
      next if index_at_guess.nil?

      hits += 1
      guess.delete_at(index_at_guess)
      code[index] = nil
    end
    hits
  end

  # Removes the number from the guess array and the unbroken code if precise hit
  def calculate_precise_hits!(guess, code)
    hits = 0

    0.upto(3) do |i|
      next unless guess[i] == code[i]

      hits += 1
      code[i] = nil
      guess[i] = nil
    end
    guess.compact!
    code.compact!
    hits
  end

  def provide_code
    code = @brain.provide_code
    p code
    code
  end
end
