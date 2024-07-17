// You are given a 2D integer array descriptions where 
// descriptions[i] = [parenti, childi, isLefti] indicates that 
// parenti is the parent of childi in a binary tree of unique values.
// If isLefti == 1, then childi is the left child of parenti.
// If isLefti == 0, then childi is the right child of parenti.
// Construct the binary tree described by descriptions and return its root.

// Time: O(n), Space: O(n)
func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
    var paths = [Int: [(Int, Bool)]]()
    var children = Set(descriptions.map { $0[1] })
    var root = 0

    for description in descriptions {
        let parent = description[0]
        let child = description[1]
        let isLeft = description[2] == 1
        
        if !children.contains(parent) { root = parent }
        paths[parent, default: []].append((child, isLeft))
    }

    func dfs(_ n: Int) -> TreeNode? {
        let newNode = TreeNode(n)

        for child in paths[n, default: []] {
            if child.1 { 
                newNode.left = dfs(child.0)
            } else {
                newNode.right = dfs(child.0)
            }
        }

        return newNode
    }

    return dfs(root)
}

print(createBinaryTree([[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]]))
print(createBinaryTree([[1,2,1],[2,3,0],[3,4,1]]))