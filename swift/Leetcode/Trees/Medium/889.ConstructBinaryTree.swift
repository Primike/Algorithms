// Given two integer arrays, preorder and postorder 
// where preorder is the preorder traversal of a binary tree 
// of distinct values and postorder is the postorder traversal 
// of the same tree, reconstruct and return the binary tree.
// If there exist multiple answers, you can return any of them.

// Time: O(n), Space: O(n)
func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
    var i = 0, j = 0

    func dfs() -> TreeNode? {
        let root = TreeNode(preorder[i])
        i += 1

        if root.val != postorder[j] { root.left = dfs() }
        if root.val != postorder[j] { root.right = dfs() }
        j += 1

        return root
    }

    return dfs()
}

print(constructFromPrePost([1,2,4,5,3,6,7], [4,5,2,6,7,3,1]))
print(constructFromPrePost([1], [1]))