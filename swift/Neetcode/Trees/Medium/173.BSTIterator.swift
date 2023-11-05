class BSTIterator {
    var stack: [TreeNode]

    init(_ root: TreeNode?) {
        self.stack = []
        var root = root

        while let node = root {
            self.stack.append(node)
            root = node.left
        }
    }
    
    func next() -> Int {
        var next = self.stack.popLast()
        var current = next?.right

        while let node = current {
            self.stack.append(node)
            current = node.left
        }

        return next?.val ?? 0
    }
    
    func hasNext() -> Bool {
        return !self.stack.isEmpty
    }
}