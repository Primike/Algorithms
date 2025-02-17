// You are given a 0-indexed integer array nums. 
// A pair of indices (i, j) is a bad pair if i < j and j - i != nums[j] - nums[i].
// Return the total number of bad pairs in nums.

func countBadPairs(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    var result = 0

    for i in 0..<nums.count {
        let difference = i - nums[i]
        result += i - dict[difference, default: 0]
        dict[difference, default: 0] += 1
    }

    return result
}

print(countBadPairs([4,1,3,3]))
print(countBadPairs([1,2,3,4,5]))