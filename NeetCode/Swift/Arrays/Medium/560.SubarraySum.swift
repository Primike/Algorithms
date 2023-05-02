//Given an array of integers nums and an integer k, 
//return the total number of subarrays whose sum equals to k.

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var dict = [0: 1]
    var result = 0
    var currentSum = 0

    for number in nums {
        currentSum += number
        let difference = currentSum - k

        result += dict[difference] ?? 0
        dict[currentSum] = (dict[currentSum] ?? 0) + 1
    }

    return result
}

print(subarraySum([1,1,1], 2))
print(subarraySum([1,2,3], 3))