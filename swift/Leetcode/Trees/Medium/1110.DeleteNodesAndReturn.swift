// Given the root of a binary tree, each node in the tree has a distinct value.
// After deleting all nodes with a value in to_delete, we are left 
// with a forest (a disjoint union of trees).
// Return the roots of the trees in the remaining forest. 
// You may return the result in any order.

// Time: O(n), Space: O(h)
func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    let toDelete = Set(to_delete)
    var result = [TreeNode]()

    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        
        if toDelete.contains(root.val) {
            if let left = root.left, !toDelete.contains(left.val) {
                result.append(left)
            }

            if let right = root.right, !toDelete.contains(right.val) {
                result.append(right)
            }
        }
        
        root.left = dfs(root.left)
        root.right = dfs(root.right)

        return toDelete.contains(root.val) ? nil : root
    } 

    if let node = dfs(root) { result.append(node) }
    return result
}