// Given the root of a binary search tree and a target value, 
// return the value in the BST that is closest to the target. 
// If there are multiple answers, print the smallest.

// Time: O(n), Space: O(h)
func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
    var result = 0
    var minimum = Double.greatestFiniteMagnitude

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        let distance = abs(Double(root.val) - target)

        if (distance < minimum) || (distance == minimum && result > root.val) {
            result = root.val
            minimum = abs(Double(root.val) - target)
        }

        dfs(root.left) 
        dfs(root.right)
    }

    dfs(root)
    return result
}