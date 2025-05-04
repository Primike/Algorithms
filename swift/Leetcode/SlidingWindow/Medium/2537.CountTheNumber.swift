// Given an integer array nums and an integer k, 
// return the number of good subarrays of nums.
// A subarray arr is good if there are at least k pairs of 
// indices (i, j) such that i < j and arr[i] == arr[j].

// Time: O(n), Space: O(n)
func countGood(_ nums: [Int], _ k: Int) -> Int {
    func combinations(_ number: Int) -> Int {
        return (number * (number - 1)) / 2
    }

    var dict = [Int: Int]()
    var result = 0
    var current = 0
    var left = 0

    for i in 0..<nums.count {
        current -= combinations(dict[nums[i], default: 0])
        dict[nums[i], default: 0] += 1
        current += combinations(dict[nums[i]]!)

        while left < i, current >= k {
            result += nums.count - i  
            current -= combinations(dict[nums[left]]!)
            dict[nums[left], default: 0] -= 1
            current += combinations(dict[nums[left]]!)
            left += 1
        }
    }

    return result
}

print(countGood([1,1,1,1,1], 10))
print(countGood([3,1,4,3,2,2,4], 2))