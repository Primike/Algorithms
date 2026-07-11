class Solution {
    func cloneTree(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        let nodeCopy = Node(root.val)
        
        for child in root.children {
            if let clonedChild = cloneTree(child) {
                nodeCopy.children.append(clonedChild)
            }
        }
        
        return nodeCopy
    }
}