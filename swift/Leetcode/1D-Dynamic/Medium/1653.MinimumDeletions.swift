// You can delete any number of characters in s to make s balanced. 
// s is balanced if there is no pair of indices (i,j) 
// such that i < j and s[i] = 'b' and s[j]= 'a'.
// Return the minimum number of deletions needed to make s balanced.

// Time: O(n), Space: O(1)
func minimumDeletions(_ s: String) -> Int {
    let s = Array(s)
    var rightDict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var leftDict = [Character: Int]()
    var result = Int.max

    for i in 0..<s.count {
        let aToTheRight = rightDict["a", default: 0]
        let bToTheLeft = leftDict["b", default: 0]

        result = min(result, aToTheRight + bToTheLeft)

        rightDict[s[i], default: 1] -= 1
        leftDict[s[i], default: 0] += 1
    }

    return min(result, leftDict["b", default: 0])
}

print(minimumDeletions("aababbab"))
print(minimumDeletions("bbaaaaabb"))


// Can also use variables
func minimumDeletions2(_ s: String) -> Int {
    let s = Array(s)
    var stayOnA = Array(repeating: Int.max, count: s.count + 1)
    var changeToB = Array(repeating: Int.max, count: s.count + 1)
    stayOnA[s.count] = 0
    changeToB[s.count] = 0

    for i in (0..<s.count).reversed() {
        changeToB[i] = changeToB[i + 1] + (s[i] == "a" ? 1 : 0)
        stayOnA[i] = min(stayOnA[i + 1], changeToB[i + 1]) + (s[i] == "b" ? 1 : 0)
    }

    return min(stayOnA[0], changeToB[0])
}

func minimumDeletions3(_ s: String) -> Int {
    let s = Array(s)
    var memo = [String: Int]()

    func dp(_ i: Int, _ isB: Bool) -> Int {
        let key = "\(i),\(isB)"

        if i == s.count { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, true) + (s[i] == "a" ? 1 : 0)
        if !isB { result = min(result, dp(i + 1, false) + (s[i] == "b" ? 1 : 0)) }

        memo[key] = result
        return result
    }

    return dp(0, false)
}