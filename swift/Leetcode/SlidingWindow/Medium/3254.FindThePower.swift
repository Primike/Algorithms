// The power of an array is defined as:
// Its maximum element if all of its elements are consecutive 
// and sorted in ascending order. -1 otherwise.
// You need to find the power of all subarrays of nums of size k.
// Return an integer array results of size n - k + 1, 
// where results[i] is the power of nums[i..(i + k - 1)].

// Time: O(n), Space: O(n)
func resultsArray(_ nums: [Int], _ k: Int) -> [Int] {
    if k == 1 { return nums }

    var result = [Int]()
    var left = 0
    var lastConsecutive = 0
    var queue = [0]

    for i in 1..<nums.count {
        if let first = queue.first, first < left { queue.removeFirst() }

        while let last = queue.last, nums[i] >= nums[last] {
            queue.removeLast()
        }

        queue.append(i)

        if nums[i] - 1 != nums[i - 1] { lastConsecutive = i }
        
        if i - left + 1 == k {
            result.append(lastConsecutive == left ? nums[queue[0]] : -1)
            left += 1
            lastConsecutive = max(left, lastConsecutive)
        } 
    }

    return result
}

print(resultsArray([1,2,3,4,3,2,5], 3))
print(resultsArray([2,2,2,2,2], 4))
print(resultsArray([3,2,3,2,3,2], 2))