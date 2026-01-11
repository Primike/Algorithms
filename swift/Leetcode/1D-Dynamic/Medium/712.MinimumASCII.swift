class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        if s1.count < s2.count {
            return minimumDeleteSum(s2, s1)
        }
        
        let m = s1.count
        let n = s2.count
        let a1 = Array(s1)
        let a2 = Array(s2)
        
        var currRow = [Int](repeating: 0, count: n + 1)
        for j in 1...n {
            currRow[j] = currRow[j - 1] + Int(a2[j - 1].asciiValue!)
        }
        
        for i in 1...m {
            var diag = currRow[0]
            currRow[0] += Int(a1[i - 1].asciiValue!)
            
            for j in 1...n {
                let prevVal = currRow[j]
                if a1[i - 1] == a2[j - 1] {
                    currRow[j] = diag
                } else {
                    currRow[j] = min(
                        Int(a1[i - 1].asciiValue!) + currRow[j],
                        Int(a2[j - 1].asciiValue!) + currRow[j - 1]
                    )
                }
                diag = prevVal
            }
        }
        
        return currRow[n]
    }
}