class Solution {
    private let mod = 1_000_000_007

    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }

        var validColorations: [Int: [Int]] = [:]
        let maskEnd = Int(pow(3.0, Double(m)))

        for mask in 0..<maskEnd {
            var colors: [Int] = []
            var currentMask = mask
            for _ in 0..<m {
                colors.append(currentMask % 3)
                currentMask /= 3
            }

            var isValidRow = true
            if m > 1 {
                for i in 0..<(m - 1) {
                    if colors[i] == colors[i + 1] {
                        isValidRow = false
                        break
                    }
                }
            }
            
            if isValidRow {
                validColorations[mask] = colors
            }
        }

        var adjacentTransitions: [Int: [Int]] = [:]
        let validMasks = Array(validColorations.keys)

        for mask1 in validMasks {
            guard let colors1 = validColorations[mask1] else { continue }
            for mask2 in validMasks {
                guard let colors2 = validColorations[mask2] else { continue }
                
                var canTransition = true
                for i in 0..<m {
                    if colors1[i] == colors2[i] {
                        canTransition = false
                        break
                    }
                }
                
                if canTransition {
                    adjacentTransitions[mask1, default: []].append(mask2)
                }
            }
        }

        var dp = [Int](repeating: 0, count: maskEnd)
        for (mask, _) in validColorations {
            dp[mask] = 1
        }

        for _ in 1..<n { 
            var nextDp = [Int](repeating: 0, count: maskEnd)
            for (prevMask, _) in validColorations {
                if dp[prevMask] == 0 {
                    continue
                }
                if let possibleNextMasks = adjacentTransitions[prevMask] {
                    for currentMask in possibleNextMasks {
                        nextDp[currentMask] += dp[prevMask]
                        if nextDp[currentMask] >= mod {
                            nextDp[currentMask] -= mod
                        }
                    }
                }
            }
            dp = nextDp
        }

        var ans = 0
        for (mask, _) in validColorations { 
            ans += dp[mask]
            if ans >= mod {
                ans -= mod
            }
        }
        
        return ans
    }
}