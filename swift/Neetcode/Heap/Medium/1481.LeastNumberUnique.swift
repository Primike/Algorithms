// Given an array of integers arr and an integer k. 
// Find the least number of unique integers after removing exactly k elements.

// Time: O(n * logn), Space: O(n)
func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
    var arr = arr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var counts = arr.values.sorted { $0 < $1 }
    var result = 0, k = k

    for i in 0..<counts.count {
        k -= counts[i]

        if k >= 0 { result += 1 }
    }

    return counts.count - result
}

print(findLeastNumOfUniqueInts([5,5,4], 1))
print(findLeastNumOfUniqueInts([4,3,1,1,3,3,2], 3))