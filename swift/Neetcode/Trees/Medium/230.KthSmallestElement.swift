// Given the root of a binary search tree, and an integer k, 
// return the kth smallest value (1-indexed) of all the 
// values of the nodes in the tree.

// Time: O(n), Space: O(h)
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var count = 0, result = 0

    func dfs(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }

        if dfs(root.left) { return true }
        
        count += 1
        if count == k {
            result = root.val
            return true
        }
        
        return dfs(root.right)
    }

    dfs(root)
    return result
}

func kthSmallest2(_ root: TreeNode?, _ k: Int) -> Int {
    var stack = [TreeNode]()
    var current = root
    var count = k
    
    while true {
        while let node = current {
            stack.append(node)
            current = node.left
        }
        
        guard let node = stack.popLast() else { break }
        
        count -= 1
        if count == 0 { return node.val }
        
        current = node.right
    }
    
    return -1 
}