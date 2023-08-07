//Given a list of non-negative integers nums, 
//arrange them such that they form the largest number and return it.
//Since the result may be very large, so you need to return a string instead of an integer.

func largestNumber(_ nums: [Int]) -> String {
    var nums = nums.map { String($0) }
    
    //lexicographically
    nums.sort { (n1, n2) -> Bool in
        return n1 + n2 > n2 + n1
    }
    
    if nums[0] == "0" { return "0" }
    
    return nums.joined()
}

print(largestNumber([21,9]))