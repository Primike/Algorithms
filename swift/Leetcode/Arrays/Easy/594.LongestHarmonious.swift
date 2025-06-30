// We define a harmonious array as an array 
// where the difference between its maximum value and 
// its minimum value is exactly 1.
// Given an integer array nums, return the length of its 
// longest harmonious subsequence among all its possible subsequences.

// Time: O(n * log(n)), Space: O(n)
func findLHS(_ nums: [Int]) -> Int {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var numbers = [(Int, Int)]()

    for (key, value) in dict {
        numbers.append((key, value))
    }

    numbers.sort { $0.0 < $1.0 }
    var result = 0

    for i in 1..<numbers.count {
        if numbers[i].0 - 1 != numbers[i - 1].0 { continue }
        result = max(result, numbers[i].1 + numbers[i - 1].1)
    }

    return result
}

print(findLHS([1,3,2,2,5,2,3,7]))
print(findLHS([1,2,3,4]))
print(findLHS([1,1,1,1]))