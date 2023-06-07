//Given an integer array nums of length n, 
//you want to create an array ans of length 2n where ans[i] == nums[i] and 
//ans[i + n] == nums[i] for 0 <= i < n (0-indexed).

func getConcatenation(_ nums: [Int]) -> [Int] {
    return Array(repeating: nums, count: 2).flatMap { $0 }
}

print(getConcatenation([1,2,1]))
print(getConcatenation([1,3,2,1]))