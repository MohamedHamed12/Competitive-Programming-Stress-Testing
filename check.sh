#!/bin/bash

# Function to compile and set executable for C++ files
compile_cpp() {
    local file=$1
    local output=$2
    if [[ $file == *.cpp ]]; then
        g++ -std=c++17 -o $output $file
    else
        cp $file $output
    fi
}

# Function to determine the command to run based on file extension
get_run_command() {
    local file=$1
    if [[ $file == *.cpp ]]; then
        echo "./$file"
    elif [[ $file == *.py ]]; then
        echo "python3 $file"
    fi
}

# Compile the test generator (assuming it's always C++)
g++ -std=c++17 -o test test.cpp

# Set the solution and brute force files
soln_file="soln.py"  # Change to your actual file
brute_file="brute.py"  # Change to your actual file

# Compile C++ files or set run command for Python files
compile_cpp $soln_file soln
compile_cpp $brute_file brute

# Determine the run commands for solution and brute force programs
soln_cmd=$(get_run_command $soln_file)
brute_cmd=$(get_run_command $brute_file)

# Print the commands to verify
echo "Solution command: $soln_cmd"
echo "Brute force command: $brute_cmd"

# Loop from 1 to 100
for i in {1..100}; do
    # Generate a test case and save it to input.in
    ./test > input.in

    # Run the solution and save the output to output.out
    $soln_cmd < input.in > output.out

    # Run the brute force solution and save the output to output2.out
    $brute_cmd < input.in > output2.out

    # Compare the outputs. If they differ, exit the script.
    if ! diff output.out output2.out > diagnostics; then
        echo "Test $i failed."
        exit 1
    fi

    # Print the current iteration number
    echo "Test $i passed."
done

# Print a success message if all tests pass
echo "All tests passed."

# #!/bin/bash

# # Compile the test generator, solution, and brute force solution
# g++ -std=c++17 -o test test.cpp
# g++ -std=c++17 -o soln soln.cpp
# g++ -std=c++17 -o brute brute.cpp

# # Loop from 1 to 100
# for i in {1..100}; do
#     # Generate a test case and save it to input.in
#     ./test > input.in

#     # Run the solution and save the output to output.out
#     ./soln < input.in > output.out

#     # Run the brute force solution and save the output to output2.out
#     ./brute < input.in > output2.out

#     # Compare the outputs. If they differ, exit the script.
#     if ! diff output.out output2.out > diagnostics; then
#         echo "Test $i failed."
#         exit 1
#     fi

#     # Print the current iteration number
#     echo "Test $i passed."
# done

# # Print a success message if all tests pass
# echo "All tests passed."
