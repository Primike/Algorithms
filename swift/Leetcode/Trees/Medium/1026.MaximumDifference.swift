// Given the root of a binary tree, find the maximum value v for 
// which there exist different nodes a and b where v = |a.val - b.val| 
// and a is an ancestor of b.

// Time: O(n), Space: O(h)
func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }

    var result = 0
    var stack = [(root, root.val, root.val)]

    while !stack.isEmpty {
        var (last, minimum, maximum) = stack.removeLast()
        result = max(result, abs(last.val - minimum))
        result = max(result, abs(last.val - maximum))
        
        minimum = min(minimum, last.val)
        maximum = max(maximum, last.val)

        if let left = last.left { stack.append((left, minimum, maximum)) }
        if let right = last.right { stack.append((right, minimum, maximum)) }
    }

    return result
}

func maxAncestorDiff2(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?, _ minimum: Int, _ maximum: Int) {
        guard let root else { return }

        result = max(result, abs(root.val - minimum))
        result = max(result, abs(root.val - maximum))

        dfs(root.left, min(minimum, root.val), max(maximum, root.val))
        dfs(root.right, min(minimum, root.val), max(maximum, root.val))
    } 

    dfs(root, root?.val ?? 0, root?.val ?? 0)
    return result
}