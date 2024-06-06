// Given an array of integers arr, find the sum of min(b), 
// where b ranges over every (contiguous) subarray of arr. 
// Since the answer may be large, return the answer modulo 109 + 7.

// Time: O(n), Space: O(n)
func sumSubarrayMins(_ arr: [Int]) -> Int {
    let mod = 1_000_000_007
    let arr = arr + [0]
    var stack = [(Int, Int)]()
    var result = 0

    for number in arr { 
        var streak = 1
        
        while let last = stack.last, last.0 >= number {
            stack.removeLast()
            result += (last.0 * last.1 * streak) % mod
            streak += last.1
        }

        stack.append((number, streak))
    }

    return result % mod
}

print(sumSubarrayMins([3,1,2,4]))
print(sumSubarrayMins([11,81,94,43,3]))