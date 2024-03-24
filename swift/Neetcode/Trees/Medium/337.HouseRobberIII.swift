// Given the root of the binary tree, return the maximum amount of money 
// the thief can rob without alerting the police.

// Time: O(n), Space: O(h)
func rob(_ root: TreeNode?) -> Int {
    func dfs(_ node: TreeNode?) -> (Int, Int) {
        guard let node = node else { return (0, 0) }

        let left = dfs(node.left)
        let right = dfs(node.right)
        
        let withNode = node.val + left.1 + right.1
        let choice1 = left.0 + right.0
        let choice2 = left.1 + right.0
        let choice3 = left.0 + right.1
        let choice4 = left.1 + right.1
        let withoutNode = max(choice1, choice2, choice3, choice4)

        return (withNode, withoutNode)
    }

    let result = dfs(root)
    return max(result.0, result.1)
}