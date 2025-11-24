// Given the root of a binary tree, return true if you can 
// partition the tree into two trees with equal sums of values 
// after removing exactly one edge on the original tree.

// Time: O(n), Space: O(h)
func checkEqualTree(_ root: TreeNode?) -> Bool {
    func getSum(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return getSum(root.left) + getSum(root.right) + root.val
    }

    let sum = getSum(root)
    if sum % 2 != 0 { return false }

    let target = sum / 2
    var result = false

    func dfs(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        let left = dfs(root.left)
        let right = dfs(root.right)

        if root.left != nil, left == target { result = true }
        if root.right != nil, right == target { result = true }
        
        return left + right + root.val
    }

    dfs(root)
    return result
}

// Time: O(n), Space: O(n)
func checkEqualTree2(_ root: TreeNode?) -> Bool {
    guard let root = root else { return false }
    
    var subTreeSums = [Int]()
    var nodeSums = [ObjectIdentifier: Int]()
    var stack = [TreeNode]()
    var lastVisited: TreeNode? = nil
    var current: TreeNode? = root
    
    while current != nil || !stack.isEmpty {
        while let node = current {
            stack.append(node)
            current = node.left
        }
        
        let last = stack.last!
        
        if let right = last.right, right !== lastVisited {
            current = right
        } else {
            var leftSum = 0, rightSum = 0

            if let left = last.left { leftSum += nodeSums[ObjectIdentifier(left)]! }
            if let right = last.right { rightSum += nodeSums[ObjectIdentifier(right)]! }

            let treeSum = last.val + leftSum + rightSum
            nodeSums[ObjectIdentifier(last)] = treeSum
            subTreeSums.append(treeSum)
            lastVisited = stack.removeLast()
        }
    }

    guard !subTreeSums.isEmpty else { return false }

    let total = subTreeSums.removeLast()
    if total % 2 != 0 { return false }
    
    return subTreeSums.contains(total / 2)
}