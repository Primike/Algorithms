// You are given the array nums consisting of n positive integers. 
// You computed the sum of all non-empty continuous subarrays from 
// the array and then sorted them in non-decreasing order, 
// creating a new array of n * (n + 1) / 2 numbers.
// Return the sum of the numbers from index left to index right 
// (indexed from 1), inclusive, in the new array. 
// Since the answer can be a huge number return it modulo 109 + 7.

// Time: O(n^2 + (2 * n) * log(2 * n)), Space: O(n)
func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
    var newArray = [Int]()

    for i in 0..<nums.count {
        var sum = 0

        for j in i..<nums.count {
            sum += nums[j]
            newArray.append(sum)
        }
    }

    newArray.sort()
    let mod = 1_000_000_007
    var result = 0

    for i in (left - 1)..<right {
        result = (result + newArray[i]) % mod
    }

    return result % mod
}

print(rangeSum([1,2,3,4], 4, 1, 5))
print(rangeSum([1,2,3,4], 4, 3, 4))
print(rangeSum([1,2,3,4], 4, 1, 10))