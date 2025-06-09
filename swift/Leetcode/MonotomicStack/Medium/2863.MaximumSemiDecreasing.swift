// You are given an integer array nums.
// Return the length of the longest semi-decreasing subarray of nums, 
// and 0 if there are no such subarrays.
// A subarray is a contiguous non-empty sequence of elements within an array.
// A non-empty array is semi-decreasing if its first element is 
// strictly greater than its last element.

// Time: O(n * logn), Space: O(n)
func maxSubarrayLength(_ nums: [Int]) -> Int {
    var monotomic = [(Int, Int)]()
    var result = 0

    for i in (0..<nums.count).reversed() {
        if monotomic.isEmpty || nums[i] < monotomic.last!.1 {
            monotomic.append((i, nums[i]))
        }
    }
    
    for i in 0..<nums.count {
        while let last = monotomic.last, nums[i] > last.1 {
            result = max(result, last.0 - i + 1)
            monotomic.removeLast()
        }
    }

    return result
}

print(maxSubarrayLength([7,6,5,4,3,2,1,6,10,11]))
print(maxSubarrayLength([57,55,50,60,61,58,63,59,64,60,63]))
print(maxSubarrayLength([1,2,3,4]))