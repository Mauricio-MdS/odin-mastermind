# frozen_string_literal: true

# Breaker moves
class Breaker
  def initialize(brain)
    @brain = brain
  end

  def provide_guess
    @brain.provide_guess
  end
end
