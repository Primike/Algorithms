import os
import sys

def count_leetcode_questions(root_dir):
    # Initialize counters for each difficulty
    counts = {"Easy": 0, "Medium": 0, "Hard": 0}
    total = 0

    # Walk through the directory tree
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith(".swift"):
                # Get the immediate parent directory name of the file
                parent_folder = os.path.basename(dirpath)
                if parent_folder in counts:
                    counts[parent_folder] += 1
                    total += 1

    return counts, total

if __name__ == "__main__":
    # Accept the root directory from command-line argument or default to current directory
    root_directory = sys.argv[1] if len(sys.argv) > 1 else "."
    
    counts, total = count_leetcode_questions(root_directory)
    
    # Print out the counts for each category
    for level in ["Easy", "Medium", "Hard"]:
        print(f"{level}: {counts[level]}")
    print(f"Total Swift files in difficulty folders: {total}")

# 4 medium