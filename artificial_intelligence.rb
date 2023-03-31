# frozen_string_literal: true

# Computer moves when role not played by human
class ArtificialIntelligence
  def provide_code
    code = []
    4.times { code.push(rand(1..6)) }
    code
  end

  # At the moment it just tries a random guess
  def provide_guess
    guess = provide_code
    puts "Computer tries #{guess.join('')}"
    provide_code
  end
end
