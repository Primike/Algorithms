// Given two integer arrays preorder and inorder where preorder is the 
// preorder traversal of a binary tree and inorder is the inorder traversal 
// of the same tree, construct and return the binary tree.

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    let inorderDict = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    var pIndex = 0

    func construct(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let value = preorder[pIndex]
        let node = TreeNode(value)
        pIndex += 1

        let iIndex = inorderDict[value]!
        node.left = construct(left, iIndex - 1)
        node.right = construct(iIndex + 1, right)

        return node
    }

    return construct(0, inorder.count - 1)
}
