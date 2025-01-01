// You are given an integer array nums. A subsequence of nums is called a square streak if:
// The length of the subsequence is at least 2, and
// after sorting the subsequence, each element (except the first element) 
// is the square of the previous number.
// Return the length of the longest square streak in nums, 
// or return -1 if there is no square streak.

// Time: O(n * log(n)), Space: O(n)
func longestSquareStreak(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    var numsSet = Set(nums)
    var visited = Set<Int>()
    var result = 0

    for number in nums {
        if visited.contains(number) { continue }

        visited.insert(number)
        var current = number
        var count = 1

        while numsSet.contains(current * current) {
            current *= current
            visited.insert(current)
            count += 1
        }

        result = max(result, count)
    }

    return result <= 1 ? -1 : result
}

print(longestSquareStreak([4,3,6,16,8,2]))
print(longestSquareStreak([2,3,5,6,7]))