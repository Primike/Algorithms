// You are given two 0-indexed integer arrays nums1 and nums2 of equal length n and 
// a positive integer k. You must choose a subsequence of indices from nums1 of length k.
// Return the maximum possible score.

func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
    var numbers = [(Int, Int)]()

    for i in 0..<nums1.count {
        numbers.append((nums1[i], nums2[i]))
    }

    numbers.sort { $0.1 > $1.1 }
    var heap = Heap<Int>(type: .minHeap)
    var result = 0
    var currentSum = 0

    for (n1, n2) in numbers {
        currentSum += n1
        heap.push(n1)

        if heap.size() > k {
            var minimum = heap.pop() ?? 0
            currentSum -= minimum
        }

        if heap.size() == k { result = max(result, currentSum * n2) }
    }

    return result
}

print(maxScore([1,3,3,2], [2,1,3,4], 3))
print(maxScore([4,2,3,1,1], [7,5,10,9,6], 1))