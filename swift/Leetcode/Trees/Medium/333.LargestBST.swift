// Given the root of a binary tree, find the largest subtree which is also a 
// Binary Search Tree (BST), where the largest means subtree has the largest number of nodes.

func largestBSTSubtree(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> (Bool, Int, Int, Int) {
        guard let root = root else { return (true, Int.max, Int.min, 0) }

        let left = dfs(root.left)
        let right = dfs(root.right)

        if left.0, right.0, root.val > left.2, root.val < right.1 {
            let count = 1 + left.3 + right.3
            result = max(result, count)
            
            return (true, min(root.val, left.1), max(root.val, right.2), count)
        }

        return (false, 0, 0, 0)
    }

    dfs(root)
    return result
}