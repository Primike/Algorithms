import os
import re
import sys
from collections import defaultdict

def find_duplicate_problems(root_dir):
    # Regex to match files that start with a number, followed by a dot, then anything, ending with .swift
    pattern = re.compile(r"^(\d+)\..*\.swift$")
    problems = defaultdict(list)

    # Walk through the directory tree
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            full_path = os.path.join(dirpath, filename)
            match = pattern.match(filename)
            if match:
                problem_number = match.group(1)
                problems[problem_number].append(full_path)

    # Check for duplicate problem numbers (i.e., more than one file with the same leading number)
    duplicates = {num: paths for num, paths in problems.items() if len(paths) > 1}

    if duplicates:
        print("Found duplicate problems based on leading numbers:\n")
        for num, paths in duplicates.items():
            print(f"Problem {num} appears in:")
            for path in paths:
                print(f"  {path}")
            print()
    else:
        print("No duplicate problems found.")

if __name__ == "__main__":
    # Provide the root directory as a command-line argument or default to the current directory.
    root_directory = sys.argv[1] if len(sys.argv) > 1 else "."
    find_duplicate_problems(root_directory)
