// You are given an array of integers nums, there is a sliding window of size k 
// which is moving from the very left of the array to the very right. 
// You can only see the k numbers in the window. 
// Each time the sliding window moves right by one position.
// Return the max sliding window.

// Time: O(n), Space: O(n)
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var queue = [(Int, Int)]()

    for (i, number) in nums.enumerated() {
        while let last = queue.last, number >= last.0 {
            queue.removeLast()
        }

        queue.append((number, i))
        
        if i >= k - 1 { result.append(queue[0].0) }
        if let first = queue.first, first.1 == i - k + 1 { queue.removeFirst() }
    }

    return result
}

print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
print(maxSlidingWindow([1], 1))