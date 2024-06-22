// Given an integer array nums and an integer k, return the 
// number of non-empty subarrays that have a sum divisible by k.

// Time: O(n), Space: O(n)
func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
    var prefixSums = [0: 1]
    var result = 0
    var sum = 0

    for number in nums {
        sum += number
        var remainder = sum % k

        if remainder < 0 { remainder += k }

        result += prefixSums[remainder, default: 0]
        prefixSums[remainder, default: 0] += 1
    }

    return result
}

print(subarraysDivByK([4,5,0,-2,-3,1], 5))
print(subarraysDivByK([5], 9))