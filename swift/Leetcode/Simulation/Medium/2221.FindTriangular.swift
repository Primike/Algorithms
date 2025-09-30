class Solution {
    func triangularSum(_ nums: [Int]) -> Int {
        var currentNums = nums

        while currentNums.count > 1 {
            var newNums = [Int]()
            for i in 0..<(currentNums.count - 1) {
                let sum = (currentNums[i] + currentNums[i + 1]) % 10
                newNums.append(sum)
            }
            currentNums = newNums
        }

        return currentNums[0]
    }
}