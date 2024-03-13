// You are given the root of a binary tree with n nodes. 
// Each node is assigned a unique value from 1 to n. 
// You are also given an array queries of size m.
// You have to perform m independent queries on the tree 
// where in the ith query you do the following:
// Remove the subtree rooted at the node with the value queries[i] from the tree. 
// It is guaranteed that queries[i] will not be equal to the value of the root.
// Return an array answer of size m where answer[i] is the 
// height of the tree after performing the ith query.

func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {
    var nodeDepths = [Int: Int]()
    var nodeHeights = [Int: Int]()
    var maxTwoOfRow = [Int: [(Int, Int)]]()

    func dfs(_ node: TreeNode?, _ row: Int) -> Int {
        guard let node = node else { return -1 }
        
        nodeDepths[node.val] = row
        let height = max(dfs(node.left, row + 1), dfs(node.right, row + 1)) + 1
        nodeHeights[node.val] = height

        maxTwoOfRow[row, default: []].append((height, node.val))
        maxTwoOfRow[row, default: []].sort { $0.0 > $1.0 }
        
        if maxTwoOfRow[row, default: []].count > 2 { maxTwoOfRow[row]?.popLast() }
        return height
    }

    dfs(root, 0)

    return queries.map { query in
        let row = nodeDepths[query, default: 0]

        if maxTwoOfRow[row]!.count == 1 {
            return row - 1
        } else if maxTwoOfRow[row]![0].1 == query {
            return maxTwoOfRow[row]![1].0 + row
        } else {
            return maxTwoOfRow[row]![0].0 + row
        }
    }
}