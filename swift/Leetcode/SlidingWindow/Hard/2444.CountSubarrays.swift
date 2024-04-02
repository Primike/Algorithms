// You are given an integer array nums and two integers minK and maxK.
// A fixed-bound subarray of nums is a subarray that 
// satisfies the following conditions:
// The minimum value in the subarray is equal to minK.
// The maximum value in the subarray is equal to maxK.
// Return the number of fixed-bound subarrays.

// Time: O(n), Space: O(1)
func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
    var result = 0
    var minIndex = -1, maxIndex = -1
    var leftBound = -1

    for (i, number) in nums.enumerated() {
        if number < minK || number > maxK { leftBound = i }
        if number == minK { minIndex = i }
        if number == maxK { maxIndex = i }

        result += max(0, min(minIndex, maxIndex) - leftBound)
    }

    return result
}

print(countSubarrays([1,3,5,2,7,5], 1, 5))
print(countSubarrays([1,1,1,1], 1, 1))