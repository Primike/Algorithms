// Given the root of a binary search tree, and an integer k, 
// return the kth smallest value (1-indexed) of all the 
// values of the nodes in the tree.

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var stack = [TreeNode]()
    var current = root
    var count = k
    
    while true {
        while let node = current {
            stack.append(node)
            current = node.left
        }
        
        guard let node = stack.popLast() else {
            break
        }
        
        count -= 1
        if count == 0 {
            return node.val
        }
        
        current = node.right
    }
    
    return -1 
