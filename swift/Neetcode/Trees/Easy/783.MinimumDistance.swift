// Given the root of a Binary Search Tree (BST), return the minimum difference 
// between the values of any two different nodes in the tree.

func minDiffInBST(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = Int.max
    var previous: TreeNode? = nil

    func depthFirst(_ root: TreeNode?) {
        guard let root = root else { return }

        depthFirst(root.left)

        if let node = previous { result = min(result, root.val - node.val) }

        previous = root
        depthFirst(root.right)
    }

    depthFirst(root)
    return result
}