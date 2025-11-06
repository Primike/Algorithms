// The x-sum of an array is calculated by the following procedure:
// Count the occurrences of all elements in the array.
// Keep only the occurrences of the top x most frequent elements. 
// If two elements have the same number of occurrences, 
// the element with the bigger value is considered more frequent.
// Calculate the sum of the resulting array.

// Time: O(n * k * log(k)), Space: O(n)
func findXSum(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
    var dict = [Int: Int]()
    var result = [Int]()
    
    for i in 0..<nums.count {
        dict[nums[i], default: 0] += 1
        if i < k - 1 { continue }

        var array = dict.map { ($0, $1) }.sorted { ($0.1, $0.0) > ($1.1, $1.0) }
        var sum = 0

        for i in 0..<min(array.count, x) {
            sum += array[i].0 * array[i].1
        }

        result.append(sum)
        dict[nums[i - k + 1], default: 0] -= 1
        if dict[nums[i - k + 1]] == 0 { dict[nums[i - k + 1]] = nil }
    }

    return result
}

print(findXSum([1,1,2,2,3,4,2,3], 6, 2))
print(findXSum([3,8,7,8,7,5], 2, 2))