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

  def solve_with_benchmarking(simulation)
    write_initial_conditions(simulation)
    call_python_solver(simulation)
    read_final_results(simulation)
  end

  def write_initial_conditions(simulation); end

  def call_python_solver(simulation); end

  def read_final_results(simulation); end
end
