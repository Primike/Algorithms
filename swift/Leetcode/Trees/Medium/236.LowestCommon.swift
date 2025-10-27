// Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

// Time: O(n), Space: O(h)
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)

    if left != nil, right != nil { return root }
    if root === p || root === q { return root }

    return left == nil ? right : left
}

// Time: O(n), Space: O(n)
func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    var nodeToParent: [Int: Int?] = [root.val: nil]
    var valToNode = [root.val: root]
    var stack = [root]

    while !stack.isEmpty {
        let last = stack.removeLast()
        
        if let left = last.left {
            nodeToParent[left.val] = last.val
            valToNode[left.val] = left
            stack.append(left)
        }

        if let right = last.right {
            nodeToParent[right.val] = last.val
            valToNode[right.val] = right
            stack.append(right)
        }
    } 

    var pAncestors = Set<Int>()
    var current = p?.val

    while let value = current {
        pAncestors.insert(value)
        current = nodeToParent[value, default: nil]
    }

    current = q?.val 

    while let value = current {
        if pAncestors.contains(value) { 
            return valToNode[value]
        }

        current = nodeToParent[value, default: nil]
    }

    return nil
}