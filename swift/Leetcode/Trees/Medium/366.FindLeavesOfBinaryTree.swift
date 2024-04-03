// Given the root of a binary tree, collect a tree's nodes 
// as if you were doing this:
// Collect all the leaf nodes.
// Remove all the leaf nodes.
// Repeat until the tree is empty.

// Time: O(n), Space: O(h)
func findLeaves(_ root: TreeNode?) -> [[Int]] {
    var levels = [Int: [Int]]()

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = dfs(root.left), right = dfs(root.right)
        let deepest = max(left, right)

        levels[deepest, default: []].append(root.val)
        return deepest + 1
    }

    dfs(root)
    let smallest = levels.keys.min() ?? 0
    let largest = levels.keys.max() ?? 0
    var result = [[Int]]()

    for i in smallest...largest {
        result.append(levels[i, default: []])
    }

    return result
}