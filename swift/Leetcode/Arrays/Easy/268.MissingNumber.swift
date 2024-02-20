// Given an array nums containing n distinct numbers in the range [0, n], 
// return the only number in the range that is missing from the array.

// Time: O(n), Space: O(n)
func missingNumber(_ nums: [Int]) -> Int {
    var numSet = Set(nums)

    for i in 0...nums.count {
        if !numSet.contains(i) { return i }
    }

    return 0
}

print(missingNumber([3,0,1]))
print(missingNumber([0,1]))
print(missingNumber([9,6,4,2,3,5,7,0,1]))