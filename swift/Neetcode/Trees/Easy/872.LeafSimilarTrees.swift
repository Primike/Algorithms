// Consider all the leaves of a binary tree, from left to right order, 
// the values of those leaves form a leaf value sequence.

// Time: O(n), Space: O(h)
func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    var leafs1 = [Int](), leafs2 = [Int]()

    func dfs(_ root: TreeNode?, _ leafs: inout [Int]) -> TreeNode? {
        guard let root = root else { return nil }

        let left = dfs(root.left, &leafs)
        let right = dfs(root.right, &leafs)

        if left == nil, right == nil { leafs.append(root.val) }

        return root
    }

    dfs(root1, &leafs1)
    dfs(root2, &leafs2)
    
    return leafs1 == leafs2
}