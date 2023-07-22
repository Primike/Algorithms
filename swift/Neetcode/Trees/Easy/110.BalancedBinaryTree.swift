//Given a binary tree, determine if it is height-balanced.

func isBalanced(_ root: TreeNode?) -> Bool {
    var balanced = true

    func checkBalance(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = checkBalance(root.left)
        let right = checkBalance(root.right)

        if abs(left - right) > 1 {
            balanced = false
        }

        return 1 + max(left, right)
    }

    checkBalance(root)
    return balanced
}
