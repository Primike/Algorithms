// Given a node in a binary search tree, 
// return the in-order successor of that node in the BST. 
// If that node has no in-order successor, return null.
// The successor of a node is the node with the 
// smallest key greater than node.val.
// You will have direct access to the node 
// but not to the root of the tree. 
// Each node will have a reference to its parent node. 

// Time: O(h), Space: O(1)
func inorderSuccessor(_ node: Node?) -> Node? {
    guard let node = node else { return nil }

    if var right = node.right {
        while let left = right.left {
            right = left
        }

        return right
    } else {
        var previous = node
        var current = node.parent

        while let parent = current, parent.left !== previous {
            current = parent.parent
            previous = parent
        }

        return current
    }
}