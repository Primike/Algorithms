// Given the root of a binary tree, collect a tree's nodes 
// as if you were doing this:
// Collect all the leaf nodes.
// Remove all the leaf nodes.
// Repeat until the tree is empty.

// Time: O(n), Space: O(h)
func findLeaves(_ root: TreeNode?) -> [[Int]] {
    var dict = [Int: [Int]]()

    func dfs(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        let left = dfs(root.left)
        let right = dfs(root.right)
        let level = max(left, right)

        dict[level, default: []].append(root.val)
        return level + 1
    }
    
    dfs(root)
    var result = Array(repeating: [Int](), count: dict.keys.count)

    for i in 0..<result.count {
        result[i] = dict[i, default: []]
    }

    return result
}