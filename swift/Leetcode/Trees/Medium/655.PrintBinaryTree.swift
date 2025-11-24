// Given the root of a binary tree, construct a 0-indexed m x n 
// string matrix res that represents a formatted layout of the tree. 

// Time: O(n), Space: O(m * n)
func printTree(_ root: TreeNode?) -> [[String]] {
    guard let root else { return [] }

    var treeHeightStack = [(root, 1)]
    var height = 1

    while !treeHeightStack.isEmpty {
        let (last, level) = treeHeightStack.removeLast()
        height = max(height, level)

        if let left = last.left { treeHeightStack.append((left, level + 1)) }
        if let right = last.right { treeHeightStack.append((right, level + 1)) }
    }

    let width = Int(pow(2.0, Double(height))) - 1
    var result = Array(repeating: Array(repeating: "", count: width), count: height)
    var printStack = [(root, 0, width / 2)]

    while !printStack.isEmpty {
        let (last, i, j) = printStack.removeLast()
        result[i][j] = String(last.val)

        let offset = Int(pow(2.0, Double(height - i - 2)))
        if let left = last.left { printStack.append((left, i + 1, j - offset)) }
        if let right = last.right { printStack.append((right, i + 1, j + offset)) }
    }

    return result
}

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