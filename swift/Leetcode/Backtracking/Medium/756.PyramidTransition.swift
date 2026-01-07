class Solution {
    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        var map = [String: [Character]]()
        for s in allowed {
            let key = String(s.prefix(2))
            map[key, default: []].append(s.last!)
        }

        func solve(_ A: [Character]) -> Bool {
            if A.count == 1 { return true }
            var ans = [Character]()
            return build(A, &ans, 0)
        }

        func build(_ A: [Character], _ ans: inout [Character], _ i: Int) -> Bool {
            if i + 1 == A.count {
                return solve(ans)
            }
            let key = String(A[i]) + String(A[i+1])
            guard let candidates = map[key] else { return false }

            for w in candidates {
                ans.append(w)
                if build(A, &ans, i + 1) { return true }
                ans.removeLast()
            }
            return false
        }

        return solve(Array(bottom))
    }
}