// A sequence of k dots is a valid unlock pattern 
// if both of the following are true:
// All the dots in the sequence are distinct.
// If the line segment connecting two consecutive dots 
// in the sequence passes through the center of any other dot, 
// the other dot must have previously appeared in the sequence. 
// No jumps through the center non-selected dots are allowed.
// Given two integers m and n, return the number of unique and valid 
// unlock patterns of the Android grid lock screen 
// that consist of at least m keys and at most n keys.

// Time: O(9!), Space: O(9)
func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
    var jumps = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    jumps[1][3] = 2
    jumps[3][1] = 2
    jumps[4][6] = 5
    jumps[6][4] = 5
    jumps[7][9] = 8
    jumps[9][7] = 8
    jumps[1][7] = 4
    jumps[7][1] = 4
    jumps[2][8] = 5
    jumps[8][2] = 5
    jumps[3][9] = 6
    jumps[9][3] = 6
    jumps[1][9] = 5
    jumps[9][1] = 5
    jumps[3][7] = 5
    jumps[7][3] = 5

    var result = 0
    var visited = Set<Int>()

    func backtrack(_ current: Int) {
        if visited.count >= m { result += 1 }
        if visited.count == n { return }

        for i in 1...9 {
            if visited.contains(i) { continue }

            visited.insert(i)

            if jumps[current][i] == 0 || visited.contains(jumps[current][i]) {
                backtrack(i)
            } 

            visited.remove(i)
        }
    }

    for i in 1...9 {
        visited.insert(i)
        backtrack(i)
        visited.remove(i)
    }

    return result
}

print(numberOfPatterns(1, 1))
print(numberOfPatterns(1, 2))