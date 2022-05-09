# frozen_string_literal: true

require 'benchmark'

# Defines helper methods specific to simulations.
module SimulationsHelper
  def solve(simulation)
    simulation.computed_at = Time.zone.now

    computation_time = Benchmark.realtime do
      solve_with_benchmarking(simulation)
    end

    simulation.computation_time = computation_time
    simulation.save!
  end

  private

  def solve_with_benchmarking(_simulation)
    sleep(2)
    # TODO: Solve the simulation...
  end
end
