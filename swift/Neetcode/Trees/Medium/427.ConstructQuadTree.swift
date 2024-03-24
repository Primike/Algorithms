// Given a n * n matrix grid of 0's and 1's only. 
// We want to represent grid with a Quad-Tree.
// Return the root of the Quad-Tree representing grid.

// Time: O(n^2), Space: O(logn)
func construct(_ grid: [[Int]]) -> Node? {
    if grid.isEmpty { return nil }

    func build(_ grid: [[Int]]) -> Node {
        if grid.count == 1 { return Node(grid[0][0] == 1, true) }

        let half = grid.count / 2
        let topLeft = build(Array(grid[0..<half].map { Array($0[0..<half]) }))
        let topRight = build(Array(grid[0..<half].map { Array($0[half...]) }))
        let bottomLeft = build(Array(grid[half...].map { Array($0[0..<half]) }))
        let bottomRight = build(Array(grid[half...].map { Array($0[half...]) }))

        if topLeft.isLeaf, topRight.isLeaf, bottomLeft.isLeaf, bottomRight.isLeaf,
            topLeft.val == topRight.val, topLeft.val == bottomLeft.val, topLeft.val == bottomRight.val {
            return Node(topRight.val, true)
        } 

        let node = Node(true, false)
        node.topLeft = topLeft
        node.topRight = topRight
        node.bottomLeft = bottomLeft
        node.bottomRight = bottomRight

        return node
    }

    return build(grid)
}

print(construct([[0,1],[1,0]]))
print(construct([
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,1,1,1,1],
    [1,1,1,1,1,1,1,1],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,0]]))