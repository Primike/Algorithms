// Given the root of a binary tree, each node in the tree has a distinct value.
// After deleting all nodes with a value in to_delete, we are left 
// with a forest (a disjoint union of trees).
// Return the roots of the trees in the remaining forest. 
// You may return the result in any order.

// Time: O(n), Space: O(h)
func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    guard let root = root else { return [] }

    let to_delete = Set(to_delete)
    var roots = [TreeNode?]()
    
    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let left = dfs(root.left), right = dfs(root.right)
        root.left = left
        root.right = right
        
        if !to_delete.contains(root.val) { return root }

        if left != nil { roots.append(left) }
        if right != nil { roots.append(right) }
        return nil 
    }

    dfs(root)
    if !to_delete.contains(root.val) { roots.append(root) }

    return roots
}