// You are given the root of a binary tree and an integer distance. 
// A pair of two different leaf nodes of a binary tree is said to be good 
// if the length of the shortest path between them is less than or equal to distance.
// Return the number of good leaf node pairs in the tree.

func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
    var result = 0
    
    @discardableResult
    func dfs(_ node: TreeNode?) -> [Int] {
        guard let node = node else { return [] }

        if node.left == nil, node.right == nil { return [1] }

        let left = dfs(node.left)
        let right = dfs(node.right)

        for l in left {
            for r in right {
                if l + r <= distance { result += 1 }
            }
        }

        return left.map { $0 + 1 } + right.map { $0 + 1 }
    }

    dfs(root)
    return result
}