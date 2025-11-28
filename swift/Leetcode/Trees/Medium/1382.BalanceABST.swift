// Given the root of a binary search tree, 
// return a balanced binary search tree with the same node values. 
// If there is more than one answer, return any of them.

// Time: O(n), Space: O(n)
func balanceBST(_ root: TreeNode?) -> TreeNode? {
    guard let root else { return nil }

    var nodes = [TreeNode]()
    var stack = [TreeNode]()
    var current: TreeNode? = root

    while !stack.isEmpty || current != nil {
        while let node = current {
            stack.append(node)
            current = node.left
        }

        let last = stack.removeLast()
        nodes.append(last)
        current = last.right
    }

    func generateTree(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let mid = (right + left) / 2
        nodes[mid].left = generateTree(left, mid - 1)
        nodes[mid].right = generateTree(mid + 1, right)

        return nodes[mid]
    }

    return generateTree(0, nodes.count - 1)
}