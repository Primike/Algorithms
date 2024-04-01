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

    var memo = [String: Int]()

    func dp(_ operation: Int, _ current: [Character]) -> Int {
        if let value = memo[String(current)] { return value }
        if current.allSatisfy { $0 == "1" } { return 0 }

        var result = 0
        
        for i in 0..<nums.count {
            if current[i] == "1" { continue }

            var newBitmask = current
            newBitmask[i] = "1"

            for j in (i + 1)..<nums.count {
                if current[j] == "1" { continue }

                newBitmask[j] = "1"
                let take = operation * gcd["\(nums[i]),\(nums[j])", default: 1]
                result = max(result, dp(operation + 1, newBitmask) + take)
                newBitmask[j] = "0"
            }
        }

        memo[String(current)] = result
        return result
    }

    let bitmask: [Character] = Array(repeating: "0", count: nums.count)
    return dp(1, bitmask)
}

print(maxScore([1,2]))
print(maxScore([3,4,6,8]))
print(maxScore([1,2,3,4,5,6]))