// You should rearrange the elements of nums such that the 
// modified array follows the given conditions:
// Every consecutive pair of integers have opposite signs.
// For all integers with the same sign, the order in which 
// they were present in nums is preserved.
// The rearranged array begins with a positive integer.

// Time: O(n), Space: O(n)
func rearrangeArray(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: nums.count)
    var positive = 0, negative = 1

    for number in nums {
        if number > 0 {
            result[positive] = number
            positive += 2
        } else {
            result[negative] = number
            negative += 2
        }
    }

    return result
}

print(rearrangeArray([3,1,-2,-5,2,-4]))
print(rearrangeArray([-1,1]))