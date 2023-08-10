// You are given an array of integers nums and an integer target.
// Return the number of non-empty subsequences of nums such that the sum 
// of the minimum and maximum element on it is less or equal to target. 
// Since the answer may be too large, return it modulo 109 + 7.

func numSubseq(_ nums: [Int], _ target: Int) -> Int {
    var nums = nums.sorted()
    let modulo = Int(1e9 + 7)
    var powersOfTwo: [Int] = Array(repeating: 0, count: nums.count)
    powersOfTwo[0] = 1
    
    for i in 1..<powersOfTwo.count {
        powersOfTwo[i] = (powersOfTwo[i - 1] * 2) % modulo
    }
    
    var left = 0, right = nums.count - 1
    var result = 0

    while left <= right {
        if nums[left] + nums[right] > target {
            right -= 1
        } else {
            result = (result + powersOfTwo[right - left]) % modulo
            left += 1
        }
    }

    return result
}

print(numSubseq([3,5,6,7], 9))
print(numSubseq([3,3,6,8], 10))
print(numSubseq([2,3,3,4,6,7], 12))