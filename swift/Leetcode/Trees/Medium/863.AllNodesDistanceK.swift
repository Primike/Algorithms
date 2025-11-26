// Given the root of a binary tree, the value of a target node target, 
// and an integer k, return an array of the values of all nodes 
// that have a distance k from the target node.
// You can return the answer in any order.

// Time: O(n), Space: O(n)
func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    guard let root, let target else { return [] }

    var neighbors = [Int: [Int]]()
    var stack = [root]

    while !stack.isEmpty {
        let last = stack.removeLast()
        
        if let left = last.left {
            neighbors[last.val, default: []].append(left.val)
            neighbors[left.val, default: []].append(last.val)
            stack.append(left)
        }

        if let right = last.right {
            neighbors[last.val, default: []].append(right.val)
            neighbors[right.val, default: []].append(last.val)
            stack.append(right)
        }
    }

    var visited = Set([target.val])
    var result = [target.val]
    var distance = 0

    while !result.isEmpty, distance < k {
        var nextLevel = [Int]()

        for i in 0..<result.count {
            let first = result[i]

            for node in neighbors[first, default: []] {
                if visited.contains(node) { continue }

                visited.insert(node)
                nextLevel.append(node)
            }
        }

        result = nextLevel
        distance += 1
    }

    return result
}