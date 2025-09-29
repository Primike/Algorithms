class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        
        guard sortedNums.count >= 3 else {
            return 0
        }
        
        for i in (2..<sortedNums.count).reversed() {
            let c = sortedNums[i]
            let b = sortedNums[i-1]
            let a = sortedNums[i-2]
            
            if a + b > c {
                return a + b + c
            }
        }
        
        return 0
    }
}