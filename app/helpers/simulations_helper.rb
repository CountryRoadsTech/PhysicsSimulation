module SimulationsHelper
  def solve(simulation, method='euler')
    # Remove dashes, hypens, etc., whitespace, and changes to all one word, lower case.
    method_stripped = method.titleize.gsub(/\s+/, '').lowercase

    if method_stripped == 'euler'
      first_order_runge_kutta_solution(simulation)
    elsif method_stripped == 'rungekutta4'
      fourth_order_runge_kutta_solution(simulation)
    else
      raise RuntimeError.new("Unknown solution method: #{method}! Try 'euler' or 'rungekutta4'.")
    end
  end

  private

  def first_order_runge_kutta_solution(simulation)

  end

  def fourth_order_runge_kutta_solution(simulation)
    # TODO
  end
end
