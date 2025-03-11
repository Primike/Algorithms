// You are given a 0-indexed 2D integer matrix grid of size n * n 
// with values in the range [1, n2]. Each integer appears 
// exactly once except a which appears twice and b which is missing. 
// The task is to find the repeating and missing numbers a and b.
// Return a 0-indexed integer array ans of size 2 where 
// ans[0] equals to a and ans[1] equals to b.

// Time: O(n), Space: O(n)
func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
    var numbers = Set(1...(grid.count * grid.count))
    var visited = Set<Int>()
    var duplicate = 0

    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if visited.contains(grid[i][j]) { duplicate = grid[i][j] }

            numbers.remove(grid[i][j])
            visited.insert(grid[i][j])
        }
    }

    return [duplicate, Array(numbers)[0]]
}

print(findMissingAndRepeatedValues([[1,3],[2,2]]))
print(findMissingAndRepeatedValues([[9,1,7],[8,9,2],[3,4,6]]))