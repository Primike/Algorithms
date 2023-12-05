// Given two integer arrays inorder and postorder where inorder is the inorder traversal 
// of a binary tree and postorder is the postorder traversal of the same tree, 
// construct and return the binary tree.

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    let inorderDict = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    var pIndex = postorder.count - 1

    func helper(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let value = postorder[pIndex]
        let node = TreeNode(value)
        pIndex -= 1
        
        let iIndex = inorderDict[value]!
        node.right = helper(iIndex + 1, right)
        node.left = helper(left, iIndex - 1)

        return node
    }

    return helper(0, inorder.count - 1) 
}