// Given the root of an n-ary tree, 
// return the postorder traversal of its nodes' values.
// Nary-Tree input serialization is represented in 
// their level order traversal. 
// Each group of children is separated by the null value (See examples)

func postorder(_ root: Node?) -> [Int] {
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