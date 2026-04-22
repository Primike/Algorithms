class Solution {
    func closestTarget(_ words: [String], _ target: String, _ startIndex: Int) -> Int {
        let n = words.count
        var ans = n

        for i in 0..<n {
            if words[i] == target {
                let dist = abs(i - startIndex)
                ans = min(ans, min(dist, n - dist))
            }
        }

        return ans < n ? ans : -1
    }
}