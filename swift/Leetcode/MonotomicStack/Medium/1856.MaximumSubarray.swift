// The min-product of an array is equal to the minimum value in 
// the array multiplied by the array's sum.
// For example, the array [3,2,5] (minimum value is 2) has a 
// min-product of 2 * (3+2+5) = 2 * 10 = 20.
// Given an array of integers nums, return the maximum min-product 
// of any non-empty subarray of nums. Since the answer may be large, 
// return it modulo 109 + 7.

// Time: O(n), Space: O(n)
func maxSumMinProduct(_ nums: [Int]) -> Int {
    let mod: Int64 = 1_000_000_007
    var result: Int64 = 0
    var monotonic = [(Int, Int64)]()

    for number in nums + [0] {
        var total: Int64 = 0

        while let last = monotonic.last, last.0 >= number {
            total += last.1
            result = max(result, total * Int64(last.0))
            monotonic.removeLast()
        }

        total += Int64(number)
        result = max(result, total * Int64(number))
        monotonic.append((number, total))
    }

    return Int(result % mod)
}

print(maxSumMinProduct([1,2,3,2]))
print(maxSumMinProduct([2,3,3,1,2]))
print(maxSumMinProduct([3,1,5,6,4,2]))