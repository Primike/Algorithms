// Given the root of a binary tree, replace the value of each node 
// in the tree with the sum of all its cousins' values.
// Two nodes of a binary tree are cousins 
// if they have the same depth with different parents.
// Return the root of the modified tree.

// Time: O(n), Space: O(n)
func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    var rows = [Int: Int]()

    func dfs(_ root: TreeNode?, _ level: Int) {
        guard let root = root else { return }

        rows[level, default: 0] += root.val

        dfs(root.left, level + 1)
        dfs(root.right, level + 1)
    }

    dfs(root, 0)

    func updateTree(_ root: TreeNode, _ level: Int) {
        let childSum = (root.left?.val ?? 0) + (root.right?.val ?? 0)

        if let left = root.left {
            updateTree(left, level + 1)
            left.val = rows[level + 1, default: 0] - childSum
        }

        if let right = root.right {
            updateTree(right, level + 1)
            right.val = rows[level + 1, default: 0] - childSum
        }
    }

    updateTree(root, 0)
    root.val = 0
    return root
}