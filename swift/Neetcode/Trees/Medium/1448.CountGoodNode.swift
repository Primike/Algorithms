// Given a binary tree root, a node X in the tree is named good 
// if in the path from root to X there are no nodes with a value greater than X.
// Return the number of good nodes in the binary tree.

func goodNodes(_ root: TreeNode?) -> Int {

    func depthFirst(_ node: TreeNode?, _ maxVal: Int) -> Int {
        guard let node = node else { return 0 }

        var result = node.val >= maxVal ? 1 : 0
        var newMax = max(node.val, maxVal)

        result += depthFirst(node.left, newMax)
        result += depthFirst(node.right, newMax)

        return result
    }

    guard let root = root else { return 0 }

    return depthFirst(root, root.val)
}
