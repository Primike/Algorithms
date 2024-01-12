// Given an array of strings nums containing n unique binary strings 
// each of length n, return a binary string of length n that does not 
// appear in nums. If there are multiple answers, you may return any of them.

// Time: O(n), Space: O(1)
func findDifferentBinaryString(_ nums: [String]) -> String {
    let nums = nums.map { Array($0) }
    var result = [String]()

    for i in 0..<nums.count {
        result.append(nums[i][i] == "0" ? "1" : "0")
    }

    return result.joined()
}

print(findDifferentBinaryString(["01","10"]))
print(findDifferentBinaryString(["00","01"]))
print(findDifferentBinaryString(["111","011","001"]))


// Time: O(2^n), Space: O(2^n)
func findDifferentBinaryString2(_ nums: [String]) -> String {
    let nums = Set(nums)

    func backtrack(_ i: Int, _ binary: String) -> (Bool, String) {
        if i == nums.count { return (!nums.contains(binary), binary) }

        let zero = backtrack(i + 1, binary + "0")
        if zero.0 { return zero }

        let one = backtrack(i + 1, binary + "1")
        if one.0 { return one }

        return (false, "")
    }

    return backtrack(0, "").1
}