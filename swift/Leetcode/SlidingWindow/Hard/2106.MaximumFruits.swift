class Solution {
    func maxTotalFruits(_ fruits: [[Int]], _ startPos: Int, _ k: Int) -> Int {
        var left = 0
        var right = 0
        let n = fruits.count
        var sum = 0
        var ans = 0

        func step(_ l: Int, _ r: Int) -> Int {
            let leftPos = fruits[l][0]
            let rightPos = fruits[r][0]
            
            if rightPos <= startPos {
                return startPos - leftPos
            } else if leftPos >= startPos {
                return rightPos - startPos
            } else {
                let distToRight = rightPos - startPos
                let distToLeft = startPos - leftPos
                return min(distToLeft, distToRight) + (rightPos - leftPos)
            }
        }
        
        while right < n {
            sum += fruits[right][1]
            
            while left <= right && step(left, right) > k {
                sum -= fruits[left][1]
                left += 1
            }
            
            ans = max(ans, sum)
            right += 1
        }
        
        return ans
    }
}