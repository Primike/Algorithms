// You are given an array of integers nums, there is a sliding window of size k 
// which is moving from the very left of the array to the very right. 
// You can only see the k numbers in the window. 
// Each time the sliding window moves right by one position.
// Return the max sliding window.

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var queue = [(Int, Int)]()
    var result = [Int]()

    for (i, number) in nums.enumerated() {
        while let last = queue.last, last.1 < number {
            queue.removeLast()
        }

        queue.append((i, number))

        if let first = queue.first, first.0 <= i - k {
            queue.removeFirst()
        }

        if i >= k - 1 {
            result.append(queue.first!.1)
        }
    }

    return result
}

print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
print(maxSlidingWindow([1], 1))