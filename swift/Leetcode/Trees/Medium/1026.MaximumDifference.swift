// Given the root of a binary tree, find the maximum value v for 
// which there exist different nodes a and b where v = |a.val - b.val| 
// and a is an ancestor of b.

// Time: O(n), Space: O(h)
func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = 0

    func dfs(_ root: TreeNode?, _ currentMin: Int, _ currentMax: Int) {
        guard let root = root else { return }

        result = max(result, abs(currentMin - root.val))
        result = max(result, abs(currentMax - root.val))

        let newMin = min(currentMin, root.val)
        let newMax = max(currentMax, root.val)

        if let left = root.left { dfs(left, newMin, newMax) }
        if let right = root.right { dfs(right, newMin, newMax) }
    }

    dfs(root, root.val, root.val)
    return result
}