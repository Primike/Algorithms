// Given an array of integers nums, calculate the pivot index of this array.
// The pivot index is the index where the sum of all the numbers 
// strictly to the left of the index is equal to 
// he sum of all the numbers strictly to the index's right.

func pivotIndex(_ nums: [Int]) -> Int {
    let totalSum = nums.reduce(0, +)
    var currentSum = 0

    for (i, number) in nums.enumerated() {
        if totalSum - number - currentSum == currentSum { return i }

        currentSum += number
    }

    return -1
}

print(pivotIndex([1,7,3,6,5,6]))
print(pivotIndex([1,2,3]))
print(pivotIndex([2,1,-1]))