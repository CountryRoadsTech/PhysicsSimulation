module SimulationsHelper
  PYTHON_PATH = File.join('/', 'usr', 'bin', 'python3')
  PYTHON_WORKING_DIR = File.join(Rails.root, 'lib', 'python')
  PYTHON_SCRIPT = File.join(PYTHON_WORKING_DIR, 'ode_solver.py')

  def solve(simulation)


    # TODO: Calculate and store computation time (start of this method to end, then save!, handle errors)


    # Write simulation parameters to file, and call Python code to run ODE solver using Scipy.
    input_path = File.join(PYTHON_WORKING_DIR, "simulation_#{simulation.name.parameterize}_parameters.input")

    # Create the output path that will be used to read the results of the Python script.
    output_path = File.join(PYTHON_WORKING_DIR, "simulation_#{simulation.name.parameterize}.output")

    # Overwrite the existing input file if it exists.
    File.open(input_path, 'w') do |input_file|
      input_file.write('Hello Test!')
      # Central body (Earth, Sun, all solar systems Mu plus radius)
      # Each physics body (start with 1)
      # Simulation name
    end

    # Call the Python script to read the input file, run the ODE solver, and output the solution to a file.
    output = `#{PYTHON_PATH} #{PYTHON_SCRIPT} #{input_path} #{output_path}`

    puts "Command status:"
    puts $CHILD_STATUS
    puts output

    # Read the results of the Python script and save.
    File.open(output_path, 'r') do |output_file|
      puts "Output File:"
      output_file.each do |output_line|
        puts output_line
      end
    end
  end
end
