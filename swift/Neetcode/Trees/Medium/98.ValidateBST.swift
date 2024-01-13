// Given the root of a binary tree, determine 
// if it is a valid binary search tree (BST).

// Time: O(n), Space: O(h)
func isValidBST(_ root: TreeNode?) -> Bool {
    var last = Int.min

    func dfs(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }

        let left = dfs(root.left)
        if last >= root.val { return false }
        last = root.val
        let right = dfs(root.right)

        return left && right
    }

    return dfs(root)
}


func isValidBST2(_ root: TreeNode?) -> Bool {
    func valid(_ root: TreeNode?, _ left: Int, _ right: Int) -> Bool {
        guard let root = root else { return true }

        if root.val <= left || root.val >= right { return false }

        return valid(root.left, left, root.val) && valid(root.right, root.val, right)
    }

    return valid(root, Int.min, Int.max)
}
