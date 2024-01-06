// Given the root of a binary tree, return the vertical order traversal 
// of its nodes' values. (i.e., from top to bottom, column by column).
// If two nodes are in the same row and column, 
// the order should be from left to right.

func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    var columns = [Int: [(Int, Int)]]()

    func dfs(_ node: TreeNode?, _ i: Int, _ j: Int) {
        guard let node = node else { return }

        columns[j, default: []].append((i, node.val))

        dfs(node.left, i + 1, j - 1)
        dfs(node.right, i + 1, j + 1)
    }

    dfs(root, 0, 0)

    var left = columns.keys.min() ?? 0
    var right = columns.keys.max() ?? 0
    var result = [[Int]]()

    for j in left...right {
        if let nodes = columns[j] {
            let sorted = nodes.sorted { $0.0 < $1.0 }
            result.append(sorted.map { $0.1 })
        }
    }

    return result
}