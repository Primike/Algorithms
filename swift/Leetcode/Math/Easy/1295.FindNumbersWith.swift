// Given an array nums of integers, 
// return how many of them contain an even number of digits.

// Time: O(n * log10(n)), Space: O(1)
func findNumbers(_ nums: [Int]) -> Int {
    var result = 0

    for i in 0..<nums.count {
        var number = nums[i]
        var count = 0

        while number > 0 {
            number /= 10
            count += 1
        }

        if count % 2 == 0 { result += 1 }
    }

    return result
}

print(findNumbers([12,345,2,6,7896]))
print(findNumbers([555,901,482,1771]))