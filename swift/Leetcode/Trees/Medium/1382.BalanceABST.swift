// Given the root of a binary search tree, 
// return a balanced binary search tree with the same node values. 
// If there is more than one answer, return any of them.

// Time: O(n), Space: O(n)
func balanceBST(_ root: TreeNode?) -> TreeNode? {
    var values = [Int]()

    func inorder(_ root: TreeNode?) {
        guard let root = root else { return }

        inorder(root.left)
        values.append(root.val)
        inorder(root.right)
    }

    inorder(root)

    func construct(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        if left == right { return TreeNode(values[left]) }

        let mid = (right + left) / 2
        let node = TreeNode(values[mid])
        node.left = construct(left, mid - 1)
        node.right = construct(mid + 1, right)

        return node
    }

    return construct(0, values.count - 1)
}