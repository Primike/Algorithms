// Given an integer array arr, partition the array into (contiguous) 
// subarrays of length at most k. After partitioning, 
// each subarray has their values changed to become the maximum value of that subarray.
// Return the largest sum of the given array after partitioning. 

// Time: O(n * k), Space: O(n)
func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
    var tab = Array(repeating: 0, count: arr.count + 1)

    for i in 1...arr.count {
        var largest = 0

        for j in 1...min(k, i) {
            largest = max(largest, arr[i - j])
            tab[i] = max(tab[i], tab[i - j] + largest * j)
        }
    }

    return tab[arr.count]
}

print(maxSumAfterPartitioning([1,15,7,9,2,5,10], 3))
print(maxSumAfterPartitioning([1,4,1,5,7,3,6,1,9,9,3], 4))
print(maxSumAfterPartitioning([1], 1))


func maxSumAfterPartitioning2(_ arr: [Int], _ k: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ index: Int) -> Int {
        if index == arr.count { return 0 }
        if let value = memo[index] { return value }

        var result = 0
        var largest = 0

        for i in index..<min(arr.count, index + k) {
            largest = max(largest, arr[i])
            result = max(result, dp(i + 1) + largest * (i - index + 1))
        }

        memo[index] = result
        return result
    }

    return dp(0)
}