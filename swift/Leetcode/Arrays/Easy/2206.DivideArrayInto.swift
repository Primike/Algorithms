// You are given an integer array nums consisting of 2 * n integers.
// You need to divide nums into n pairs such that:
// Each element belongs to exactly one pair.
// The elements present in a pair are equal.
// Return true if nums can be divided into n pairs, otherwise return false.

// Time: O(n), Space: O(n)
func divideArray(_ nums: [Int]) -> Bool {
    let counts = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }.values
    return counts.filter { $0 % 2 != 0 }.count == 0
}

print(divideArray([3,2,3,2,2,2]))
print(divideArray([1,2,3,4]))