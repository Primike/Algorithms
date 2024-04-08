// Given a circular integer array nums (i.e., the next element of nums[nums.length - 1] 
// is nums[0]), return the next greater number for every element in nums.

// Time: O(n), Space: O(n)
func nextGreaterElements(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: -1, count: nums.count)
    var stack = [(Int, Int)]()

    for (i, number) in nums.enumerated() {
        while let last = stack.last, last.1 < number {
            result[last.0] = number
            stack.removeLast()
        }

        stack.append((i, number))
    }

    for (i, number) in nums.enumerated() {
        while let last = stack.last, last.1 < number {
            result[last.0] = number
            stack.removeLast()
        }
    }

    return result
}

print(nextGreaterElements([1,2,1]))
print(nextGreaterElements([1,2,3,4,3]))


func nextGreaterElements2(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: -1, count: nums.count)
    var stack = [Int]()

    for i in stride(from: 2 * nums.count - 1, to: -1, by: -1) {
        while let last = stack.last, nums[last] <= nums[i % nums.count] {
            stack.removeLast()
        }

        if let last = stack.last { result[i % nums.count] = nums[last] }
        
        stack.append(i % nums.count)
    }

    return result
}