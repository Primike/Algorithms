// Given the root of an n-ary tree, 
// return the postorder traversal of its nodes' values.
// Nary-Tree input serialization is represented in 
// their level order traversal. 
// Each group of children is separated by the null value (See examples)

// Time: O(n), Space: O(n)
func postorder(_ root: Node?) -> [Int] {
    guard let root = root else { return [] }

    var stack = [(root, false)]
    var result = [Int]()
    
    while !stack.isEmpty {
        let (last, bool) = stack.removeLast()

        if bool {
            result.append(last.val)
        } else {
            stack.append((last, true))
            
            for i in (0..<last.children.count).reversed() {
                stack.append((last.children[i], false))
            }
        }
    }

    return result
}


func postorder2(_ root: Node?) -> [Int] {
    guard let root = root else { return [] }

    var stack = [root]
    var result = [Int]()

    while !stack.isEmpty {
        let last = stack.removeLast()
        result.append(last.val)

        for node in last.children {
            stack.append(node)
        }
    }

    return result.reversed()
}


func postorder3(_ root: Node?) -> [Int] {
    guard let root = root else { return [] }

    var stack = [root]
    var preorder = [Node]()

    while !stack.isEmpty {
        let last = stack.removeLast()
        preorder.append(last)

        for node in last.children {
            stack.append(node)
        }
    }

    return preorder.map { $0.val }.reversed()
}


func postorder4(_ root: Node?) -> [Int] {
    var result = [Int]()

    func dfs(_ root: Node?) {
        guard let root = root else { return }

        for child in root.children {
            dfs(child)
        }

        result.append(root.val)
    }

    dfs(root)
    return result
}