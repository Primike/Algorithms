class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        var count = 0
        let sortedNums = nums.sorted()

        guard sortedNums.count >= 3 else {
            return 0
        }

        for i in 0..<(sortedNums.count - 2) {
            if sortedNums[i] == 0 {
                continue
            }
            var k = i + 2
            for j in (i + 1)..<(sortedNums.count - 1) {
                while k < sortedNums.count && sortedNums[i] + sortedNums[j] > sortedNums[k] {
                    k += 1
                }
                if k > j {
                    count += k - j - 1
                }
            }
        }
        return count
    }
}