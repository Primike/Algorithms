// You are given nums, an array of positive integers of size 2 * n. 
// You must perform n operations on this array.
// In the ith operation (1-indexed), you will:
// Choose two elements, x and y.
// Receive a score of i * gcd(x, y).
// Remove x and y from nums.
// Return the maximum score you can receive after performing n operations.

// Time: O(n^2 * log(n + m) + 2^n * n^2), Space: O(n^2 + 2^n * n^2)
func maxScore(_ nums: [Int]) -> Int {
    func getGCD(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        
        while b != 0 {
            let remainder = a % b
            a = b
            b = remainder
        }
        
        return a
    }

    var gcd = [[Int]: Int]()

    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count {
            gcd[[i, j]] = getGCD(nums[i], nums[j])
        }
    }

    var memo = [[Int]: Int]()

    func dp(_ bitmask: [Int], _ n: Int) -> Int {
        if bitmask.allSatisfy({ $0 == 1 }) { return 0 }
        if let value = memo[bitmask] { return value }

        var result = 0
        var bitmask = bitmask

        for i in 0..<nums.count {
            if bitmask[i] == 1 { continue }
            bitmask[i] = 1

            for j in (i + 1)..<nums.count {
                if bitmask[j] == 1 { continue }

                bitmask[j] = 1
                result = max(result, gcd[[i, j], default: 1] * n + dp(bitmask, n + 1))
                bitmask[j] = 0
            }

            bitmask[i] = 0
        }

        memo[bitmask] = result
        return result
    }

    return dp(Array(repeating: 0, count: nums.count), 1)
}

print(maxScore([1,2]))
print(maxScore([3,4,6,8]))
print(maxScore([1,2,3,4,5,6]))