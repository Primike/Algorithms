class Solution {
    func minBuildTime(_ blocks: [Int], _ split: Int) -> Int {
        var sortedBlocks = blocks.sorted(by: >)
        let n = sortedBlocks.count
        
        func possible(_ limit: Int) -> Bool {
            var currentLimit = limit
            var worker = 1
            
            for (index, time) in sortedBlocks.enumerated() {
                if worker <= 0 || time > currentLimit {
                    return false
                }
                
                while time + split <= currentLimit {
                    currentLimit -= split
                    worker *= 2
                    
                    if worker >= n - index {
                        return true
                    }
                }
                
                worker -= 1
            }
            
            return true
        }
        
        var left = sortedBlocks[0]
        var right = Int(ceil(log2(Double(n)))) * split + sortedBlocks[0]
        
        while left < right {
            let mid = left + (right - left) / 2
            if possible(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return right
    }
}