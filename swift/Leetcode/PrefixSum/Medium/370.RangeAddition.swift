class Solution {
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        var result = Array(repeating: 0, count: length)

        for update in updates {
            let start = update[0]
            let end = update[1]
            let val = update[2]

            result[start] += val
            if end < length - 1 {
                result[end + 1] -= val
            }
        }

        for i in 1..<length {
            result[i] += result[i - 1]
        }

        return result
    }
}