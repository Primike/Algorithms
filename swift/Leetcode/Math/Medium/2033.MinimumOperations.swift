// You are given a 2D integer grid of size m x n and an integer x. 
// In one operation, you can add x to or subtract x 
// from any element in the grid.
// A uni-value grid is a grid where all the elements of it are equal.
// Return the minimum number of operations to make the grid uni-value. 
// If it is not possible, return -1.

// Time: O(m * n * log(m * n)), Space: O(m * n)
func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
    let remainder = grid[0][0] % x
    var numbers = [Int]()

    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] % x != remainder { return -1 }
            numbers.append(grid[i][j])
        }
    }

    numbers.sort()
    let median = numbers[numbers.count / 2]
    var result = 0

    for number in numbers {
        let difference = abs(median - number)
        result += difference / x
    }

    return result
}

print(minOperations([[2,4],[6,8]], 2))
print(minOperations([[1,5],[2,3]], 1))
print(minOperations([[1,2],[3,4]], 2))