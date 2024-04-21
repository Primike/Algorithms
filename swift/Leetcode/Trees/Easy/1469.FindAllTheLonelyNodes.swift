// In a binary tree, a lonely node is a node that is the only child 
// of its parent node. The root of the tree is not lonely because 
// it does not have a parent node.
// Given the root of a binary tree, return an array containing 
// the values of all lonely nodes in the tree. Return the list in any order.

// Time: O(n), Space: O(h)
func getLonelyNodes(_ root: TreeNode?) -> [Int] {
    var result = [Int]()

    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let left = dfs(root.left), right = dfs(root.right)

        if left != nil, right != nil { return root }
        if left == nil, right == nil { return root }
        if left == nil { result.append(right?.val ?? 0) }
        if right == nil { result.append(left?.val ?? 0) }

        return root
    }

    dfs(root)
    return result
}