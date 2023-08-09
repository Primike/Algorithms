//Given a 1-indexed array of integers 
//numbers that is already sorted in non-decreasing order, 
//find two numbers such that they add up to a specific target number.

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0, right = numbers.count - 1

    while left < right {
        if numbers[left] + numbers[right] == target {
            return [left + 1, right + 1]
        } else if numbers[left] + numbers[right] > target {
            right -= 1
        } else {
            left += 1
        }
    }

    return [left, right]
}

print(twoSum([2,7,11,15], 9))
print(twoSum([2,3,4], 6))
print(twoSum([-1, 0], -1))
print(twoSum([1,2,4,5,6,7,10,11,12], 9))
