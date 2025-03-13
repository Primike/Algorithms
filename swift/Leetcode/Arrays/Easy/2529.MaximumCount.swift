// Given an array nums sorted in non-decreasing order, 
// return the maximum between the number of 
// positive integers and the number of negative integers.
// In other words, if the number of positive integers 
// in nums is pos and the number of negative integers is neg, 
// then return the maximum of pos and neg.
// Note that 0 is neither positive nor negative.

// Time: O(n), Space: O(1)
func maximumCount(_ nums: [Int]) -> Int {
    var negative = 0, positive = 0

    for number in nums {
        if number < 0 {
            negative += 1
        } else if number > 0 {
            positive += 1
        }
    }

    return max(negative, positive)
}

print(maximumCount([-2,-1,-1,1,2,3]))
print(maximumCount([-3,-2,-1,0,0,1,2]))
print(maximumCount([5,20,66,1314]))