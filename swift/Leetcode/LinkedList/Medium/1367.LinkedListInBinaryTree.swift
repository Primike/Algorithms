// Given a binary tree root and a linked list with head as the first node. 
// Return True if all the elements in the linked list starting 
// from the head correspond to some downward path connected 
// in the binary tree otherwise return False.
// In this context downward path means a path that starts at 
// some node and goes downwards.

func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
    guard let root = root else { return false }

    func dfs(_ node: TreeNode?, _ head: ListNode?) -> Bool {
        if head == nil { return true }
        guard let node = node, let head = head else { return false }
        if node.val != head.val { return false }

        return dfs(node.left, head.next) || dfs(node.right, head.next)
    }

    func checkPath(_ node: TreeNode?, _ head: ListNode?) -> Bool {
        guard let node = node else { return false }
        if dfs(node, head) { return true }
        
        return checkPath(node.left, head) || checkPath(node.right, head)
    }

    return checkPath(root, head)
}