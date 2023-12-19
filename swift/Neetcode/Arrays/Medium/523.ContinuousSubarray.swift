//Given an integer array nums and an integer k, 
//return true if nums has a good subarray or false otherwise.
//A good subarray is a subarray where:
//its length is at least two, and
//the sum of the elements of the subarray is a multiple of k.

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    var dict: [Int: Int] = [0: -1]
    var currentSum = 0

    for (i, number) in nums.enumerated() {
        currentSum += number

        if let index = dict[currentSum % k], i - index >= 2 {
            return true
        } else if dict[currentSum % k] == nil {
            dict[currentSum % k] = i
        }
    }

    return false
}

print(checkSubarraySum([23,2,4,6,7], 6))
print(checkSubarraySum([23,2,6,4,7], 6))
print(checkSubarraySum([23,2,6,4,7], 13))