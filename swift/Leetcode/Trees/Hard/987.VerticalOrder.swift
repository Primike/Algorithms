// Given the root of a binary tree, calculate the vertical order traversal of the binary tree.
// The vertical order traversal of a binary tree is a list of top-to-bottom orderings
// for each column index starting from the leftmost column and ending on the rightmost column. 
// There may be multiple nodes in the same row and same column. 
// In such a case, sort these nodes by their values.

func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var dict = [Int: [(Int, Int)]]()
    var queue = [(root, (0, 0))]

    while !queue.isEmpty {
        let (first, (r, c)) = queue.removeFirst()
        dict[c, default: []].append((first.val, r))

        if let left = first.left { queue.append((left, (r + 1, c - 1))) }
        if let right = first.right { queue.append((right, (r + 1, c + 1))) }
    }

    var left = dict.keys.min() ?? 0
    var right = dict.keys.max() ?? 0
    var result = [[Int]]()

    for i in left...right {
        if let values = dict[i] { 
            let sorted = values.sorted { ($0.1, $0.0) < ($1.1, $1.0) }
            let mapped = sorted.map { $0.0 }
            result.append(mapped) 
        }
    }

    return result
}