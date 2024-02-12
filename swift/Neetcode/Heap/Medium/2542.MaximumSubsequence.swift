// You are given two 0-indexed integer arrays nums1 and nums2 of equal length n and 
// a positive integer k. You must choose a subsequence of indices from nums1 of length k.
// Return the maximum possible score.

/* 
If number is immediately popped doesnt matter because array
is sorted so the previous multiple (already calculated) is 
larger than the current multiple
*/

// Time: O(n * logn), Space: O(n)
func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
    var numbers = [(Int, Int)]()

    for i in 0..<nums1.count {
        numbers.append((nums1[i], nums2[i]))
    }

    numbers.sort { $0.1 > $1.1 }
    var heap = Heap<Int>(.minHeap)
    var result = 0
    var current = 0

    for (number, multiple) in numbers {
        current += number
        heap.push(number)

        if heap.count > k { current -= heap.pop()! }
        if heap.count == k { result = max(result, current * multiple) }
    }

    return result
}

print(maxScore([1,3,3,2], [2,1,3,4], 3))
print(maxScore([4,2,3,1,1], [7,5,10,9,6], 1))