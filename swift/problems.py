import os
import re
import sys

def list_solved_problems(root_dir, difficulty):
    # Regex to match files that start with a number, then a dot, then anything, ending with .swift
    pattern = re.compile(r"^(\d+)\..*\.swift$")
    problem_numbers = set()

    print(f"Scanning directory: {root_dir} for {difficulty} problems\n")
    # Recursively walk the directory tree
    for dirpath, _, filenames in os.walk(root_dir):
        # Check the immediate parent folder of the file (the current dirpath)
        parent_folder = os.path.basename(dirpath)
        if parent_folder.lower() != difficulty.lower():
            continue

        for filename in filenames:
            full_path = os.path.join(dirpath, filename)
            match = pattern.match(filename)
            if match:
                problem_numbers.add(int(match.group(1)))
            else:
                print(f"Skipped: {full_path}")

    sorted_numbers = sorted(problem_numbers)
    print("\nResults:")
    if not sorted_numbers:
        print("No matching Swift files were found.")
    else:
        for i, num in enumerate(sorted_numbers, 1):
            print(f"{i}: {num}")

if __name__ == "__main__":
    # Change this variable to "Easy", "Medium", or "Hard" as needed
    selected_difficulty = "Medium"
    # Accept the root directory from command-line argument or default to current directory
    root_directory = sys.argv[1] if len(sys.argv) > 1 else "."
    list_solved_problems(root_directory, selected_difficulty)
