// An array is considered special if every pair of its 
// adjacent elements contains two numbers with different parity.
// You are given an array of integer nums and a 2D integer matrix queries, 
// where for queries[i] = [fromi, toi] your task is to check that
// subarray nums[fromi..toi] is special or not.
// Return an array of booleans answer such that answer[i] is true 
// if nums[fromi..toi] is special.

// Time: O(n), Space: O(n)
func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
    var prefixArray = Array(repeating: 0, count: nums.count)

    for i in 1..<nums.count {
        prefixArray[i] += prefixArray[i - 1]
        let parity1 = nums[i - 1] % 2 == 0
        let parity2 = nums[i] % 2 == 0

        if parity1 != parity2 { prefixArray[i] += 1 }
    }

    var result = [Bool]()

    for query in queries {
        let l = query[0], r = query[1]
        let count = prefixArray[r] - prefixArray[l]
        result.append(count == r - l)
    }

    return result
}

print(isArraySpecial([3,4,1,2,6], [[0,4]]))
print(isArraySpecial([4,3,1,6], [[0,2],[2,3]]))