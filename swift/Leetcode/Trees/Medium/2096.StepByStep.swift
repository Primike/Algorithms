// Find the shortest path starting from node s and ending at node t. 
// Generate step-by-step directions of such path as a string consisting of only 
// the uppercase letters 'L', 'R', and 'U'. Each letter indicates a specific direction:
// 'L' means to go from a node to its left child node.
// 'R' means to go from a node to its right child node.
// 'U' means to go from a node to its parent node.
// Return the step-by-step directions of the shortest path from node s to node t.

// Time: O(n), Space: O(n)
func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
    var path = ""

    func dfs(_ root: TreeNode?) -> (Bool, Bool, String) {
        guard let root = root else { return (false, false, "") }

        let left = dfs(root.left), right = dfs(root.right)
        var leftPath = left.2, rightPath = right.2

        if left.0 { leftPath = (left.1 ? leftPath + "U" : "L" + leftPath) }
        if right.0 { rightPath = (right.1 ? rightPath + "U" : "R" + rightPath) }

        if left.0, right.0 {
            path = left.1 ? leftPath + rightPath : rightPath + leftPath
        } else if (left.0 || right.0), (root.val == startValue || root.val == destValue) {
            path = left.0 ? leftPath : rightPath
        } else if left.0 {
            return (true, left.1, leftPath)
        } else if right.0 {
            return (true, right.1, rightPath)
        }

        var isEdgeNode = root.val == startValue || root.val == destValue
        return (isEdgeNode, root.val == startValue, "")
    }

    let search = dfs(root)
    if search.0, path == "" { return search.2 }

    return path
}

func getDirections2(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
    var neighbors = [Int: [(Int, String)]]()

    func dfs(_ root: TreeNode?, _ parent: Int) -> Int? {
        guard let root = root else { return nil }

        var paths = [(Int, String)]()

        if parent != -1 { paths.append((parent, "U")) }
        if let left = dfs(root.left, root.val) { paths.append((left, "L")) }
        if let right = dfs(root.right, root.val) { paths.append((right, "R")) }

        neighbors[root.val] = paths
        return root.val
    }

    dfs(root, -1)
    var queue = [(startValue, "")]
    var visited = Set([startValue])

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (first, string) = queue.removeFirst()

            for (node, direction) in neighbors[first, default: []] {
                if visited.contains(node) { continue }
                if node == destValue { return string + direction }

                visited.insert(node)
                queue.append((node, string + direction))
            }
        }
    }

    return ""
}