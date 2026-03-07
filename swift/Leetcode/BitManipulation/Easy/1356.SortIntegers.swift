class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        return arr.sorted { a, b in
            let weightA = a.nonzeroBitCount
            let weightB = b.nonzeroBitCount
            
            if weightA != weightB {
                return weightA < weightB
            } else {
                return a < b
            }
        }
    }
}