// Given the root of a binary tree and two integers val and depth, 
// add a row of nodes with value val at the given depth depth.
// Note that the root node is at depth 1.

// Time: O(n), Space: O(n)
func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    func dfs(_ node: TreeNode?, _ currentDepth: Int) -> TreeNode? {
        guard let node = node else { return nil }

        if currentDepth == depth - 1 {
            node.left = TreeNode(val, node.left, nil) 
            node.right = TreeNode(val, nil, node.right)
        } else {
            node.left = dfs(node.left, currentDepth + 1)
            node.right = dfs(node.right, currentDepth + 1)
        }

        return node
    }

    if depth == 1 { return TreeNode(val, root, nil) }

    return dfs(root, 1)
}