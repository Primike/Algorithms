// A subset of nums is beautiful if it does not contain 
// two integers with an absolute difference equal to k.
// Return the number of non-empty beautiful subsets of the array nums.

func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
    let nums = nums.sorted()
    var dict = [Int: Int]()
    
    func countBeautifulSubsets(_ i: Int) -> Int {
        if i == nums.count { return 1 }
        
        var result = countBeautifulSubsets(i + 1)
        
        if dict[nums[i] - k] == nil {
            dict[nums[i], default: 0] += 1
            result += countBeautifulSubsets(i + 1)
            dict[nums[i], default: 0] -= 1

            if dict[nums[i]] == 0 { dict.removeValue(forKey: nums[i]) }
        }
        
        return result
    }
    
    return countBeautifulSubsets(0) - 1
}

print(beautifulSubsets([2,4,6], 2))
print(beautifulSubsets([1], 1))