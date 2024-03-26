// Type-1: Remove the character at the start of the string s 
// and append it to the end of the string.
// Type-2: Pick any character in s and flip its value, i.e., 
// if its value is '0' it becomes '1' and vice-versa.
// Return the minimum number of type-2 operations you need to 
// perform such that s becomes alternating.

// Time: O(n), Space: O(n)
func minFlips(_ s: String) -> Int {
    let s2 = Array(s + s), n = s.count
    var zeroStart = [Character](), oneStart = [Character]()

    for i in 0..<(2 * n) {
        zeroStart.append(i % 2 == 0 ? "1" : "0")
        oneStart.append(i % 2 == 0 ? "0" : "1")
    }

    var zeroCount = 0, oneCount = 0
    var result = Int.max

    for i in 0..<(2 * n) {
        if zeroStart[i] != s2[i] { zeroCount += 1 }
        if oneStart[i] != s2[i] { oneCount += 1 }

        if i >= n {
            if zeroStart[i - n] != s2[i - n] { zeroCount -= 1 }
            if oneStart[i - n] != s2[i - n] { oneCount -= 1 }
        }

        if i >= n - 1 {
            result = min(result, zeroCount, oneCount)
        }
    }

    return result
}

print(minFlips("111000"))
print(minFlips("010"))
print(minFlips("1110"))