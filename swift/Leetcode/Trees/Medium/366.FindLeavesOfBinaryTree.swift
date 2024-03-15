// Given the root of a binary tree, collect a tree's nodes 
// as if you were doing this:
// Collect all the leaf nodes.
// Remove all the leaf nodes.
// Repeat until the tree is empty.

// Time: O(n), Space: O(n)
func findLeaves(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var leafs = [Int: [Int]]()

    func dfs(_ root: TreeNode) -> Int {
        var height = 0

        if let left = root.left {
            let depth = dfs(left)
            leafs[depth, default: []].append(left.val)
            height = max(depth, height)
        }

        if let right = root.right {
            let depth = dfs(right)
            leafs[depth, default: []].append(right.val)
            height = max(depth, height)
        }

        return height + 1
    }

    let depth = dfs(root)
    leafs[depth, default: []].append(root.val)
    var result = [[Int]]()

    for i in 1...(leafs.keys.max() ?? 1) {
        result.append(leafs[i, default: []])
    }

    return result
}