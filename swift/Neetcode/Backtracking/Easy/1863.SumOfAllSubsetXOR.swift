// The XOR total of an array is defined as the bitwise XOR 
// of all its elements, or 0 if the array is empty.
// For example, the XOR total of the array [2,5,6] is 2 XOR 5 XOR 6 = 1.
// Given an array nums, return the sum of all XOR totals 
// for every subset of nums. 

func subsetXORSum(_ nums: [Int]) -> Int {
    var result = 0

    for number in nums {
        result |= number
    }

    return result << (nums.count - 1)
}

print(subsetXORSum([1,3]))
print(subsetXORSum([5,1,6]))
print(subsetXORSum([3,4,5,6,7,8]))