// Given an integer array nums, return the number of longest increasing subsequences.

// for if it updates the number of subsequences ending in nums[i]
// for else if it adds becuase  it has already found one of same length

// Time: O(n^2), Space: O(n)
func findNumberOfLIS(_ nums: [Int]) -> Int {
    var subsequences = Array(repeating: 1, count: nums.count) 
    var tab = Array(repeating: 1, count: nums.count)  

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                if tab[i] < tab[j] + 1 {
                    tab[i] = tab[j] + 1
                    subsequences[i] = subsequences[j]
                } else if tab[i] == tab[j] + 1 {
                    subsequences[i] += subsequences[j]
                }
            }
        }
    }

    let longest = tab.max() ?? 1
    var result = 0

    for i in 0..<nums.count {
        if tab[i] == longest { result += subsequences[i] }
    }

    return result
}

print(findNumberOfLIS([1,3,5,4,7]))
print(findNumberOfLIS([2,2,2,2,2]))