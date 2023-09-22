// Given an integer array nums, return the length of the longest strictly increasing subsequence

func lengthOfLIS(_ nums: [Int]) -> Int {
    var tab = Array(repeating: 1, count: nums.count)

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] { tab[i] = max(tab[i], tab[j] + 1) }
        }
    }

    return tab.max() ?? 0
}

print(lengthOfLIS([10,9,2,5,3,7,101,18]))
print(lengthOfLIS([0,1,0,3,2,3]))
print(lengthOfLIS([7,7,7,7,7,7,7]))