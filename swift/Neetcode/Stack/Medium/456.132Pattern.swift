// Given an array of n integers nums, a 132 pattern is a subsequence of 
// three integers nums[i], nums[j] and nums[k] such that 
// i < j < k and nums[i] < nums[k] < nums[j].
// Return true if there is a 132 pattern in nums, otherwise, return false.

func find132pattern(_ nums: [Int]) -> Bool {
    var stack = [(Int, Int)]()
    var currentMin = nums[0]

    for i in 1..<nums.count {
        while let last = stack.last, nums[i] >= last.0 {
            stack.removeLast()
        }

        if let last = stack.last, nums[i] > last.1 {
            return true
        }

        stack.append((nums[i], currentMin))
        currentMin = min(currentMin, nums[i])
    }

    return false
}

print(find132pattern([1,2,3,4]))
print(find132pattern([3,1,4,2]))
print(find132pattern([-1,3,2,0]))

func find132pattern2(_ nums: [Int]) -> Bool {
    if nums.count < 3 { return false }
    
    var stack = [Int]()
    var third = Int.min
    
    for num in nums.reversed() {
        if num < third { return true }
        
        while !stack.isEmpty, let last = stack.last, num > last {
            third = stack.removeLast()
        }
        
        stack.append(num)
    }
    
    return false
}