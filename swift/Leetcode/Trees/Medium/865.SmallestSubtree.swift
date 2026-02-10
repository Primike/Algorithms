class Solution {
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ node: TreeNode?) -> (node: TreeNode?, dist: Int) {
            guard let node = node else {
                return (nil, 0)
            }

            let left = dfs(node.left)
            let right = dfs(node.right)

            if left.dist > right.dist {
                return (left.node, left.dist + 1)
            } else if right.dist > left.dist {
                return (right.node, right.dist + 1)
            } else {
                return (node, left.dist + 1)
            }
        }

        return dfs(root).node
    }
}