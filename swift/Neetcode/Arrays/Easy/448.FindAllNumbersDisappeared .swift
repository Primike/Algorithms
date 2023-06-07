//Given an array nums of n integers where nums[i] is in the range [1, n], 
//return an array of all the integers in the range [1, n] 
//that do not appear in nums.

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var nums = nums
    var result = [Int]()

    //enumerated() produces an EnumeratedSequence<[Int]>
    //so index is not needed as it uses original nums values
    for (i, number) in nums.enumerated() {
        // let index = abs(number) - 1
        nums[number - 1] = abs(nums[number - 1]) * -1
    }

    for (i, number) in nums.enumerated() {
        if number > 0 {
            result.append(i + 1)
        }
    }

    return result
}

print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))
print(findDisappearedNumbers([1,1]))