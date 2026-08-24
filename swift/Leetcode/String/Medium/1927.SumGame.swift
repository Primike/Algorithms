class Solution {
    func sumGame(_ num: String) -> Bool {
        let chars = Array(num)
        let n = chars.count
        
        func get(_ s: ArraySlice<Character>) -> (Int, Int) {
            var nn = 0
            var qq = 0
            for ch in s {
                if ch == "?" {
                    qq += 1
                } else {
                    nn += ch.wholeNumberValue!
                }
            }
            return (nn, qq)
        }
        
        let (n0, q0) = get(chars[0..<n / 2])
        let (n1, q1) = get(chars[n / 2..<n])
        
        return (q0 + q1) % 2 == 1 || n0 - n1 != (q1 - q0) * 9 / 2
    }
}