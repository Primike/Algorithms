// Given the root of a binary search tree and a target value, 
// return the value in the BST that is closest to the target. 
// If there are multiple answers, print the smallest.

// Time: O(h), Space: O(1)
func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
    var result = 0
    var closest = Double.greatestFiniteMagnitude
    var current = root 

    while let node = current {
        let value = Double(node.val)
        let difference = abs(value - target)

        if difference < closest {
            result = node.val
            closest = difference
        } else if difference == closest {
            result = min(result, node.val)
        }

        if value > target {
            current = node.left
        } else {
            current = node.right
        }
    }

    return result
}

// Time: O(h), Space: O(h)
func closestValue2(_ root: TreeNode?, _ target: Double) -> Int {
    var result = 0
    var closest = Double.greatestFiniteMagnitude

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        let value = Double(root.val)
        let difference = abs(value - target)

        if difference < closest {
            result = root.val
            closest = difference
        } else if difference == closest {
            result = min(result, root.val)
        }

        if value > target {
            dfs(root.left)
        } else {
            dfs(root.right)
        }
    }

    dfs(root)
    return result
}