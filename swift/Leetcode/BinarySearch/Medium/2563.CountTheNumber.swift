// Given a 0-indexed integer array nums of size n and two integers 
// lower and upper, return the number of fair pairs.
// A pair (i, j) is fair if:
// 0 <= i < j < n, and
// lower <= nums[i] + nums[j] <= upper

func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
    let nums = nums.sorted()
    var result = 0

    for (i, number) in nums.enumerated() {
        var left = i + 1, right = nums.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if number + nums[mid] >= lower {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        let lowerBound = left
        left = i + 1
        right = nums.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if number + nums[mid] <= upper {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        let upperBound = right
        result += max(0, upperBound - lowerBound + 1)
    }        

    return result
}

print(countFairPairs([0,1,7,4,4,5], 3, 6))
print(countFairPairs([1,7,9,2,5], 11, 11))