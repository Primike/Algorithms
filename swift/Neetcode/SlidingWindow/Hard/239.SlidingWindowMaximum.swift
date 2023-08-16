// You are given an array of integers nums, there is a sliding window of size k 
// which is moving from the very left of the array to the very right. 
// You can only see the k numbers in the window. 
// Each time the sliding window moves right by one position.
// Return the max sliding window.

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var queue = [Int]()
    var left = 0

    for i in 0..<nums.count {
        while let last = queue.last, nums[last] < nums[i] {
            queue.removeLast()
        }

        queue.append(i)

        if let first = queue.first, left > first {
            queue.removeFirst()
        }

        if (i + 1) >= k {
            result.append(nums[queue[0]])
            left += 1
        }
    }

    return result
}

print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
print(maxSlidingWindow([1], 1))