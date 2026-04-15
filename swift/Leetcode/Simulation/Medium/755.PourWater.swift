class Solution {
    func pourWater(_ H: [Int], _ V: Int, _ K: Int) -> [Int] {
        var H = H
        let n = H.count

        for _ in 0..<V {
            var found = false
            for d in [-1, 1] {
                var i = K
                var best = K
                while i + d >= 0 && i + d < n && H[i + d] <= H[i] {
                    if H[i + d] < H[i] {
                        best = i + d
                    }
                    i += d
                }
                if best != K {
                    H[best] += 1
                    found = true
                    break
                }
            }
            if !found {
                H[K] += 1
            }
        }
        return H
    }
}