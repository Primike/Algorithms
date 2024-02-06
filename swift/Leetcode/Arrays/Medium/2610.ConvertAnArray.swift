// You are given an integer array nums. You need to create a 2D array 
// from nums satisfying the following conditions:
// The 2D array should contain only the elements of the array nums.
// Each row in the 2D array contains distinct integers.
// The number of rows in the 2D array should be minimal.
// Return the resulting array. If there are multiple answers, return any of them.

// Time: O(n), Space: O(n)
func findMatrix(_ nums: [Int]) -> [[Int]] {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = Array(repeating: [Int](), count: dict.values.max() ?? 1)

    for (key, value) in dict {
        for i in 0..<value {
            result[i].append(key)
        }
    }

    return result  
}

print(findMatrix([1,3,4,1,2,3,1]))
print(findMatrix([1,2,3,4]))