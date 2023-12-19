//Given an array of integers nums and an integer k, 
//return the total number of subarrays whose sum equals to k.

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var dict = [Int: Int]()
    var result = 0
    var currentSum = 0

    for number in nums {
        currentSum += number
        if currentSum == k { result += 1 }
        
        result += dict[currentSum - k, default: 0]
        dict[currentSum, default: 0] += 1
    }

    return result
}

print(subarraySum([1,1,1], 2))
print(subarraySum([1,2,3], 3))