// Given an integer array nums, return the number of subarrays filled with 0.

func zeroFilledSubarray(_ nums: [Int]) -> Int {
    var result = 0, count = 0

    for number in nums {
        if number == 0 {
            count += 1
            result += count
        } else {
            count = 0
        }
    }

    return result
}

print(zeroFilledSubarray([1,3,0,0,2,0,0,4]))
print(zeroFilledSubarray([0,0,0,2,0,0]))
print(zeroFilledSubarray([2,10,2019]))