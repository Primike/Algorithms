// You are given the root of a binary tree with unique values, 
// and an integer start. At minute 0, an infection starts from the 
// node with value start. Each minute, a node becomes infected if:
// The node is currently uninfected. The node is adjacent to an infected node.
// Return the number of minutes needed for the entire tree to be infected.

// Time: O(n), Space: O(h)
func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
    var result = 0

    @discardableResult
    func dfs(_ root: TreeNode?, _ start: Int) -> Int {
        guard let root = root else { return 0 }

        let left = dfs(root.left, start)
        let right = dfs(root.right, start)

        var depth = 0

        if root.val == start {
            result = max(left, right)
            depth = -1
        } else if left >= 0, right >= 0 {
            depth = max(left, right) + 1
        } else {
            result = max(result, abs(left) + abs(right))
            depth = min(left, right) - 1
        }

        return depth
    }

    dfs(root, start)
    return result
}

func amountOfTime2(_ root: TreeNode?, _ start: Int) -> Int {
    var neighbors = [Int: [Int]]()

    func createGraph(_ root: TreeNode?) {
        guard let root = root else { return }

        if let left = root.left {
            neighbors[root.val, default: []].append(left.val)
            neighbors[left.val, default: []].append(root.val)
            createGraph(left)
        }

        if let right = root.right {
            neighbors[root.val, default: []].append(right.val)
            neighbors[right.val, default: []].append(root.val)
            createGraph(right)
        }
    }

    createGraph(root)
    var visited = Set<Int>()
    var result = 0

    func dfs(_ n: Int, _ time: Int) {
        if visited.contains(n) { return }

        visited.insert(n)
        result = max(result, time)

        for node in neighbors[n, default: []] {
            dfs(node, time + 1)
        }
    }

    dfs(start, 0)
    return result
}
