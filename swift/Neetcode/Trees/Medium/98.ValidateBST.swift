// Given the root of a binary tree, determine 
// if it is a valid binary search tree (BST).

func isValidBST(_ root: TreeNode?) -> Bool {
    func valid(_ node: TreeNode?, _ left: Int, _ right: Int) -> Bool {
        guard let node = node else { return true }

        if node.val <= left || node.val >= right {
            return false
        }

        return valid(node.left, left, node.val) && valid(node.right, node.val, right)
    }

    return valid(root, Int.min, Int.max)
}
