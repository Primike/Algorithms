// You are given nums, an array of positive integers of size 2 * n. 
// You must perform n operations on this array.
// In the ith operation (1-indexed), you will:
// Choose two elements, x and y.
// Receive a score of i * gcd(x, y).
// Remove x and y from nums.
// Return the maximum score you can receive after performing n operations.

// Time: O(n^2 * log(n + m) + 2^n * n^2), Space: O(n^2 + 2^n * n^2)
func maxScore(_ nums: [Int]) -> Int {
    var gcd = [String: Int]()

    func getGCD(_ i: Int, _ j: Int) -> Int {
        if j == 0 { return i }

        return getGCD(j, i % j)
    }

    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count {
            gcd["\(nums[i]),\(nums[j])"] = getGCD(nums[i], nums[j])
        }
    }

    var memo = [Set<Int>: Int]()

    func dp(_ operation: Int, _ visited: Set<Int>) -> Int {
        if visited.count == nums.count { return 0 }
        if let value = memo[visited] { return value }

        var result = 1

        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if visited.contains(i) || visited.contains(j) { continue }

                var newSet = Set(visited + [i, j])
                let take = operation * gcd["\(nums[i]),\(nums[j])", default: 1]
                let recursion = dp(operation + 1, newSet)
                result = max(result, take + recursion)
            }
        }

        memo[visited] = result
        return result
    }

    return dp(1, [])
}

print(maxScore([1,2]))
print(maxScore([3,4,6,8]))
print(maxScore([1,2,3,4,5,6]))