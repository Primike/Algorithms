// You are given an array nums consisting of positive integers.
// Return the total frequencies of elements in nums such that 
// those elements all have the maximum frequency.
// The frequency of an element is the number of 
// occurrences of that element in the array.

// Time: O(n), Space: O(n)
func maxFrequencyElements(_ nums: [Int]) -> Int {
    var dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var frequency = Array(repeating: 0, count: nums.count + 1)

    for (key, value) in dict {
        frequency[value] += 1
    }

    var maximum = dict.values.max() ?? 0
    
    return maximum * frequency[maximum]
}

print(maxFrequencyElements([1,2,2,3,1,4]))
print(maxFrequencyElements([1,2,3,4,5]))