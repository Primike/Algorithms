// Given the root of a binary tree, find the largest subtree which is also a 
// Binary Search Tree (BST), where the largest means subtree has the largest number of nodes.

// Time: O(n), Space: O(h)
func largestBSTSubtree(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> (Bool, Int, Int, Int) {   
        guard let root = root else { return (true , .max, .min, 0) }

        let left = dfs(root.left), right = dfs(root.right)

        if !left.0 || !right.0 { return (false, 0, 0, 0) }
        if left.2 >= root.val || right.1 <= root.val { return (false, 0, 0, 0) }
        
        let smallest = min(root.val, left.1)
        let largest = max(root.val, right.2)
        let nodes = 1 + left.3 + right.3
        result = max(result, nodes)

        return (true, smallest, largest, nodes)
    }

    dfs(root)
    return result
}