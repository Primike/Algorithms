// Given a list of non-negative integers nums, 
// arrange them such that they form the largest number and return it.
// Since the result may be very large, so you need to return a string instead of an integer.

//lexicographically
func largestNumber(_ nums: [Int]) -> String {
    var nums = nums.map { String($0) }.sort { return $0 + $1 > $1 + $0 }
    
    if nums[0] == "0" { return "0" }
    
    return nums.joined()
}

print(largestNumber([21,9]))