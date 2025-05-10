// Given the root of a binary tree, the value of a target node target, 
// and an integer k, return an array of the values of all nodes 
// that have a distance k from the target node.
// You can return the answer in any order.

// Time: O(n), Space: O(n)
func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    var neighbors = [Int: [Int]]()

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        if let left = root.left {
            neighbors[left.val, default: []].append(root.val)
            neighbors[root.val, default: []].append(left.val)
            dfs(left)
        }

        if let right = root.right {
            neighbors[right.val, default: []].append(root.val)
            neighbors[root.val, default: []].append(right.val)
            dfs(right)
        }
    }

    dfs(root)
    guard let target = target else { return [] }

    var visited = Set([target.val])
    var queue = [target.val]
    var time = 0

    while !queue.isEmpty, time < k {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()

            for next in neighbors[first, default: []] {
                if visited.contains(next) { continue }
                
                visited.insert(next)
                queue.append(next)
            }
        }

        time += 1
    }

    return time == k ? queue : []
}