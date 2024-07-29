// You are given an array of positive integers arr. 
// Perform some operations (possibly none) on arr so that it satisfies these conditions:
// The value of the first element in arr must be 1.
// The absolute difference between any 2 adjacent elements 
// must be less than or equal to 1. 
// There are 2 types of operations that you can perform any number of times:
// Decrease the value of any element of arr to a smaller positive integer.
// Rearrange the elements of arr to be in any order.
// Return the maximum possible value of an element in arr 
// after performing the operations to satisfy the conditions.

// Time: O(n * log(n)), Space: O(n)
func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
    var arr = arr.sorted()
    arr[0] = 1

    for i in 1..<arr.count {
        if arr[i] - arr[i - 1] > 1 { arr[i] = arr[i - 1] + 1 }
    }

    return arr.max() ?? 1
}

print(maximumElementAfterDecrementingAndRearranging([2,2,1,2,1]))
print(maximumElementAfterDecrementingAndRearranging([100,1,1000]))
print(maximumElementAfterDecrementingAndRearranging([1,2,3,4,5]))