class Solution {
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        var minLimit = Int.min
        var stack: [Int] = []
        
        for num in preorder {
            while !stack.isEmpty && stack.last! < num {
                minLimit = stack.popLast()!
            }
            
            if num <= minLimit {
                return false
            }
            
            stack.append(num)
        }
        
        return true
    }
}