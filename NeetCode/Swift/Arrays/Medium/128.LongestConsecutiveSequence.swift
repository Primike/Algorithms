//Given an unsorted array of integers nums, 
//return the length of the longest consecutive elements sequence.
//You must write an algorithm that runs in O(n) time.

func longestConsecutive(_ nums: [Int]) -> Int {
    let numsSet = Set(nums)
    var result = 0

    for number in nums {
        if !numsSet.contains(number - 1) {
            var count = 0
            
            while numsSet.contains(number + count) {
                count += 1
            }

            result = max(result, count)
        }
    }

    return result
}

print(longestConsecutive([100,4,200,1,3,2]))
print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))