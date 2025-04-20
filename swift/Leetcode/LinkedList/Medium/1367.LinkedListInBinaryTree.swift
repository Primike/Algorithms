// Given a binary tree root and a linked list with head as the first node. 
// Return True if all the elements in the linked list starting 
// from the head correspond to some downward path connected 
// in the binary tree otherwise return False.
// In this context downward path means a path that starts at 
// some node and goes downwards.

// Time: O(n * l), Space: O(h)
func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
    guard let head = head else { return true }

    func checkSubTree(_ node: TreeNode?, _ list: ListNode?) -> Bool {
        guard let list = list else { return true }
        guard let node = node else { return false }

        if list.val != node.val { return false }
        if checkSubTree(node.left, list.next) { return true }
        if checkSubTree(node.right, list.next) { return true }

        return false
    }

    func dfs(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }

        if root.val == head.val, checkSubTree(root, head) { return true }
        if dfs(root.left) { return true }
        if dfs(root.right) { return true }

        return false
    }

    return dfs(root)
}