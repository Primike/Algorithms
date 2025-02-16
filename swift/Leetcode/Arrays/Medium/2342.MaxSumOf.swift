// You are given a 0-indexed array nums consisting of positive integers. 
// You can choose two indices i and j, such that i != j, 
// and the sum of digits of the number nums[i] is equal to that of nums[j].
// Return the maximum value of nums[i] + nums[j] that you can obtain 
// over all possible indices i and j that satisfy the conditions.

// Time: O(n * log(n)), Space: O(n)
func maximumSum(_ nums: [Int]) -> Int {
    let sums = nums.map { Array(String($0)).map { Int(String($0))! }.reduce(0, +) }
    let numbers = Array(zip(sums, nums)).sorted { ($0.0, $0.1) < ($1.0, $1.1) }
    var result = -1

    for i in 1..<numbers.count {
        if numbers[i].0 == numbers[i - 1].0 {
            result = max(result, numbers[i].1 + numbers[i - 1].1)
        }
    }

    return result
}

print(maximumSum([18,43,36,13,7]))
print(maximumSum([10,12,19,14]))