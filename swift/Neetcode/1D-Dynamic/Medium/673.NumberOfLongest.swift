// Given an integer array nums, return the number of longest increasing subsequences.

// for if it updates the number of subsequences ending in nums[i]
// for else if it adds becuase  it has already found one of same length
func findNumberOfLIS(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    var tab = Array(repeating: 1, count: nums.count)  

    for i in 0..<nums.count {
        dict[i] = 1 

        for j in 0..<i {
            if nums[i] > nums[j] {
                if tab[i] < tab[j] + 1 {
                    tab[i] = tab[j] + 1
                    dict[i] = dict[j, default: 1]
                } else if tab[i] == tab[j] + 1 {
                    dict[i, default: 0] += dict[j, default: 0]
                }
            }
        }
    }

    let maximum = tab.max() ?? 1
    var result = 0

    for i in 0..<nums.count {
        if tab[i] == maximum { result += dict[i, default: 0] }
    }

    return result
}