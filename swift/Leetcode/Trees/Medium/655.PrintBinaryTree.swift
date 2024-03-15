// Given the root of a binary tree, construct a 0-indexed m x n 
// string matrix res that represents a formatted layout of the tree. 

// Time: O(n), Space: O(m * n)
func printTree(_ root: TreeNode?) -> [[String]] {
    func findHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(findHeight(root.left), findHeight(root.right)) + 1
    }

    let rows = findHeight(root), cols = Int(pow(2.0, Double(rows))) - 1
    var grid = Array(repeating: Array(repeating: "", count: cols), count: rows)

    func dfs(_ root: TreeNode?, _ i: Int, _ j: Int) {
        guard let root = root else { return }

        grid[i][j] = String(root.val)
        let offset = Int(pow(2.0, Double(rows - i - 2)))
        dfs(root.left, i + 1, j - offset)
        dfs(root.right, i + 1, j + offset)
    }

    dfs(root, 0, (cols / 2))
    return grid
}