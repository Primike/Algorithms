// Given the root of a binary tree, calculate the vertical order traversal of the binary tree.
// The vertical order traversal of a binary tree is a list of top-to-bottom orderings
// for each column index starting from the leftmost column and ending on the rightmost column. 
// There may be multiple nodes in the same row and same column. 
// In such a case, sort these nodes by their values.

// Time: O(n * log(n)), Space: O(n)
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

func verticalTraversal2(_ root: TreeNode?) -> [[Int]] {
    var nodes = [Int: [(Int, Int)]]()

    func dfs(_ root: TreeNode?, _ x: Int, _ y: Int) {
        guard let root = root else { return }

        nodes[x, default: []].append((root.val, y))
        dfs(root.left, x - 1, y + 1)
        dfs(root.right, x + 1, y + 1)
    }

    dfs(root, 0, 0)
    var result = [[(Int, Int)]]()
    let minimum = nodes.keys.min() ?? 0
    let maximum = nodes.keys.max() ?? 0

    for i in minimum...maximum {
        if let array = nodes[i] { 
            result.append(array.sorted { ($0.1, $0.0) < ($1.1, $1.0) }) 
        }
    }   

    return result.map { $0.map { $0.0 } }
}