// Given an integer array of size n, find all elements 
// that appear more than ⌊ n/3 ⌋ times.

// Time: O(n), Space: O(n)
func majorityElement(_ nums: [Int]) -> [Int] {
    var dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Int]()

    for (key, value) in dict {
        if value > nums.count / 3 { result.append(key) }
    }

    return result
}

print(majorityElement([3,2,3]))
print(majorityElement([1]))
print(majorityElement([1,2]))