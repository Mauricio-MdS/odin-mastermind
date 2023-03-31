# frozen_string_literal: true

# Coder moves
class Coder
  def initialize(brain)
    @brain = brain
    @code = provide_code
  end

  def check_guess(guess)
    hits = calculate_hits!(guess)
    if hits == 4
      puts 'BREAKER won the game!'
      return true
    end

    false
  end

  private

  def calculate_hits!(guess)
    unbroken_code = @code.clone
    precise_hits = calculate_precise_hits!(guess, unbroken_code)
    out_of_order = calculate_out_of_order!(guess, unbroken_code)
    puts "#{precise_hits} numbers on the right position." if precise_hits.positive?
    puts "#{out_of_order} numbers out of order." if out_of_order.positive?
    puts '0 hits.' if precise_hits.zero? && out_of_order.zero?
    precise_hits
  end

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
    guess.each_with_index do |number, index|
      next unless number == code[index]

      hits += 1
      guess[index] = nil
      code[index] = nil
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
