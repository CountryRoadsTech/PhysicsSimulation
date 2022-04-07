import sys

def read_input_parameters(input_path):
    with open(input_path, 'r') as input_file:
        for input_line in input_file:
            parsed_input = input_line.rstrip()
            print(parsed_input)

def write_output_solution(output_path):
    with open(output_path, 'w') as output_file:
        output_file.write('The Solution!\n')

if __name__ == '__main__':
    read_input_parameters(sys.argv[1])

    write_output_solution(sys.argv[2])
