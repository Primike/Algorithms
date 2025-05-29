class Solution {
    func getWordsInLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        let n = groups.count
        if n == 0 {
            return []
        }

        var dp = Array(repeating: 1, count: n)
        var prev = Array(repeating: -1, count: n)
        var maxIndex = 0

        for i in 1..<n {
            for j in 0..<i {
                if groups[i] != groups[j] && check(s1: words[i], s2: words[j]) {
                    if dp[j] + 1 > dp[i] {
                        dp[i] = dp[j] + 1
                        prev[i] = j
                    }
                }
            }
            if dp[i] > dp[maxIndex] {
                maxIndex = i
            }
        }

        var ans: [String] = []
        var currentIndex = maxIndex
        
        while currentIndex != -1 {
            ans.append(words[currentIndex])
            currentIndex = prev[currentIndex]
        }
        ans.reverse()

        return ans
    }

    private func check(s1: String, s2: String) -> Bool {
        if s1.count != s2.count {
            return false
        }
        
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        var diff = 0
        
        for i in 0..<arr1.count {
            if arr1[i] != arr2[i] {
                diff += 1
            }
            if diff > 1 {
                return false
            }
        }
        return diff == 1
    }
}