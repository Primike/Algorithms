class Solution {
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        var seen: [Int] = []

        @discardableResult
        func getSum(_ node: TreeNode?) -> Int {
            guard let node = node else {
                return 0
            }
            let currentSum = getSum(node.left) + getSum(node.right) + node.val
            seen.append(currentSum)
            return currentSum
        }

        let total = getSum(root)
        
        guard !seen.isEmpty else {
            return false
        }
        
        seen.removeLast()
        
        if total % 2 != 0 {
            return false
        }
        
        return seen.contains(total / 2)
    }
}