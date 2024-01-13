// Given the root of a Binary Search Tree (BST), return the minimum difference 
// between the values of any two different nodes in the tree.

// Time: O(n), Space: O(h)
func minDiffInBST(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = Int.max
    var previous: TreeNode? = nil

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        dfs(root.left)

        if let node = previous { result = min(result, root.val - node.val) }

        previous = root
        dfs(root.right)
    }

    dfs(root)
    return result
}