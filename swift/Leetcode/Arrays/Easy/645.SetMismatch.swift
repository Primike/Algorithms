// You have a set of integers s, which originally contains all the numbers 
// from 1 to n. Unfortunately, due to some error, one of the numbers in s 
// got duplicated to another number in the set, which results in repetition 
// of one number and loss of another number.
// You are given an integer array nums representing the data status 
// of this set after the error.
// Find the number that occurs twice and the number that is missing and 
// return them in the form of an array.

// Time: O(n), Space: O(n)
func findErrorNums(_ nums: [Int]) -> [Int] {
    var nums = nums
    var numSet = Set<Int>()
    var double = 1

    for number in nums {
        if numSet.contains(number) { double = number }
        nums[number - 1] = abs(nums[number - 1]) * -1
        numSet.insert(number)
    }

    for i in 0..<nums.count {
        if nums[i] > 0 { return [double, i + 1] }
    }

    return []
}

print(findErrorNums([1,2,2,4]))
print(findErrorNums([1,1]))