// The teacher will give each student a problem starting 
// with the student number 0, then the student number 1, 
// and so on until the teacher reaches the student number n - 1. 
// After that, the teacher will restart the process, 
// starting with the student number 0 again.
// When the student number i is given a problem to solve, 
// they will use chalk[i] pieces of chalk to solve that problem. 
// However, if the current number of chalk pieces is strictly less 
// than chalk[i], then the student number i will be asked to 
// replace the chalk.
// Return the index of the student that will replace the chalk pieces.

// Time: O(n), Space: O(1)
func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
    let total = chalk.reduce(0, +)
    var current = k % total

    for i in 0..<chalk.count {
        if current < chalk[i] { return i }
        current -= chalk[i]
    }

    return 0
}

print(chalkReplacer([5,1,5], 22))
print(chalkReplacer([3,4,1,2], 25))