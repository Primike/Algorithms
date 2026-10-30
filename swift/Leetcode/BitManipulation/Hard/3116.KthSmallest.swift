class Solution {
    func findKthSmallest(_ coins: [Int], _ k: Int) -> Int {
        let sortedCoins = coins.sorted()
        var filteredCoins = [Int]()
        
        for x in sortedCoins {
            if filteredCoins.allSatisfy({ x % $0 != 0 }) {
                filteredCoins.append(x)
            }
        }
        
        let n = filteredCoins.count
        let m = 1 << n
        var lcm = [Int](repeating: 1, count: m)
        
        var left = k
        var right = filteredCoins[0] * k + 1
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            var x = a
            var y = b
            while y != 0 {
                let temp = y
                y = x % y
                x = temp
            }
            return x
        }
        
        for mask in 1..<m {
            let preMask = mask & (mask - 1)
            let lowestBit = mask & -mask
            let i = lowestBit.trailingZeroBitCount
            
            let g = gcd(lcm[preMask], filteredCoins[i])
            let tmp = lcm[preMask] / g
            
            if tmp <= right / filteredCoins[i] {
                lcm[mask] = tmp * filteredCoins[i]
            } else {
                lcm[mask] = right + 1
            }
        }
        
        func get(_ x: Int) -> Int {
            var count = 0
            for mask in 1..<m {
                if lcm[mask] > x {
                    continue
                }
                if mask.nonzeroBitCount & 1 != 0 {
                    count += x / lcm[mask]
                } else {
                    count -= x / lcm[mask]
                }
            }
            return count
        }
        
        while left < right {
            let mid = left + (right - left) / 2
            if get(mid) >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}