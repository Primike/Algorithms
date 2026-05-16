// Given an array of positive integers nums, 
// return an array answer that consists of the digits 
// of each integer in nums after separating them in 
// the same order they appear in nums.
// To separate the digits of an integer is to get 
// all the digits it has in the same order.

// Time: O(n * log10(n)), Space: O(n)
func separateDigits(_ nums: [Int]) -> [Int] {
    var result = [Int]()

    for i in 0..<nums.count {
        var digits = [Int]()
        var number = nums[i]
        
        while number > 0 {
            let digit = number % 10
            number /= 10
            digits.append(digit)
        }

        result += digits.reversed()
    }

    return result
}

print(separateDigits([13,25,83,77]))
print(separateDigits([7,1,3,9]))