// Given a positive integer n, find the pivot integer x such that:
// The sum of all elements between 1 and x inclusively equals 
// the sum of all elements between x and n inclusively.
// Return the pivot integer x. If no such integer exists, 
// return -1. It is guaranteed that there will be at most 
// one pivot index for the given input.

// Time: O(1), Space: O(1)
func pivotInteger(_ n: Int) -> Int {
    let sum = n * (n + 1) / 2
    let pivot = Int(sqrt(Double(sum)))

    return pivot * pivot == sum ? pivot : -1
}

print(pivotInteger(8))
print(pivotInteger(1))
print(pivotInteger(-1))


// Time: O(log(n)), Space: O(1)
func pivotInteger2(_ n: Int) -> Int {
    func arithmetic(_ x: Int, _ y: Int) -> Int {
        return (y - x + 1) * (x + y) / 2
    }

    if n == 1 { return 1 }

    let total = arithmetic(1, n)
    var left = 1, right = n 

    while left < right {
        let mid = (right + left) / 2
        let leftSum = arithmetic(1, mid - 1)

        if leftSum > total - leftSum - mid {
            right = mid
        } else if leftSum < total - leftSum - mid {
            left = mid + 1
        } else {
            return mid
        }
    }

    if left == 1  { return -1 }

    let leftSum = arithmetic(1, left - 1)
    return (leftSum == total - left - leftSum) ? left : -1
}