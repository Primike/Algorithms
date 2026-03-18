class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
        var result = 0
        var isOne = s.first == "1"

        for char in s {
            if isOne {
                if char != "1" { 
                    result += 1
                    isOne = false
                }
            } else {
                if char == "1" { isOne = true }
            }
        }
        
        if isOne { result += 1 }
        return result <= 1
    }
}