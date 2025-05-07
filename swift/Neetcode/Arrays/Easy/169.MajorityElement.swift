// Given an array nums of size n, return the majority element.

// Time: O(n), Space: O(1)
func majorityElement(_ nums: [Int]) -> Int {
    var result = 0
    var count = 0

    for number in nums {
        if count == 0 { result = number } 
        
        count += number == result ? 1 : -1
    }

    return result
}

print(majorityElement([3,2,3]))
print(majorityElement([2,2,1,1,1,2,2]))