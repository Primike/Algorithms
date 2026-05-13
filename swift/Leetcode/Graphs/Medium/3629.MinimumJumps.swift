private enum FactorStorage {
    static let mx = 1000001
    static let factors: [[Int]] = {
        var f = Array(repeating: [Int](), count: mx)
        for i in 2..<mx {
            if f[i].isEmpty {
                for j in stride(from: i, to: mx, by: i) {
                    f[j].append(i)
                }
            }
        }
        return f
    }()
}

class Solution {
    func minJumps(_ nums: [Int]) -> Int {
        let n = nums.count
        var edges = [Int: [Int]]()
        
        for i in 0..<n {
            for p in FactorStorage.factors[nums[i]] {
                edges[p, default: []].append(i)
            }
        }
        
        var res = 0
        var seen = Array(repeating: false, count: n)
        seen[0] = true
        var q = [0]
        
        while !q.isEmpty {
            var q2 = [Int]()
            for i in q {
                if i == n - 1 {
                    return res
                }
                
                if i > 0 && !seen[i - 1] {
                    seen[i - 1] = true
                    q2.append(i - 1)
                }
                
                if i < n - 1 && !seen[i + 1] {
                    seen[i + 1] = true
                    q2.append(i + 1)
                }
                
                if FactorStorage.factors[nums[i]].count == 1 {
                    let p = nums[i]
                    if let targets = edges[p] {
                        for j in targets {
                            if !seen[j] {
                                seen[j] = true
                                q2.append(j)
                            }
                        }
                        edges.removeValue(forKey: p)
                    }
                }
            }
            q = q2
            res += 1
        }
        
        return -1
    }
}