class Solution {
    func maximumNumberOfOnes(_ width: Int, _ height: Int, _ sideLength: Int, _ maxOnes: Int) -> Int {
        var count = [Int]()
        
        for r in 0..<sideLength {
            for c in 0..<sideLength {
                let num = (1 + (width - c - 1) / sideLength) * (1 + (height - r - 1) / sideLength)
                count.append(num)
            }
        }
        
        count.sort(by: >)
        return count.prefix(maxOnes).reduce(0, +)
    }
}