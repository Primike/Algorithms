// Given an integer array arr, partition the array into (contiguous) 
// subarrays of length at most k. After partitioning, 
// each subarray has their values changed to become the maximum value of that subarray.
// Return the largest sum of the given array after partitioning. 

// Time: O(n * k), Space: O(n)
func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
    var tab = Array(repeating: 0, count: arr.count)

    for i in 0..<tab.count {
        var maximum = Int.min

        for j in 1...k {
            if i - j + 1 >= 0 {
                maximum = max(maximum, arr[i - j + 1])
                tab[i] = max(tab[i], (i >= j ? tab[i - j] : 0) + maximum * j)
            }
        }
    }

    return tab[tab.count - 1]
}

print(maxSumAfterPartitioning([1,15,7,9,2,5,10], 3))
print(maxSumAfterPartitioning([1,4,1,5,7,3,6,1,9,9,3], 4))
print(maxSumAfterPartitioning([1], 1))