// In one operation:
// choose an index i such that 0 <= i < nums.length,
// increase your score by nums[i], and
// replace nums[i] with ceil(nums[i] / 3).
// Return the maximum possible score you can 
// attain after applying exactly k operations.

// Time: O(n * log(n)), Space: O(n)
func maxKelements(_ nums: [Int], _ k: Int) -> Int {
    var heap = Heap<Int>(.maxHeap, nums)
    var result = 0

    for i in 0..<k {
        let first = heap.pop()!
        result += first
        heap.push(Int(ceil(Double(first) / 3.0)))
    }

    return result
}

print(maxKelements([10,10,10,10,10], 5))
print(maxKelements([1,10,3,3,3], 3))