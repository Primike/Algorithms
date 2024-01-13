// Given a n * n matrix grid of 0's and 1's only. 
// We want to represent grid with a Quad-Tree.
// Return the root of the Quad-Tree representing grid.

// Time: O(n^2 * logn), Space: O(logn)
func construct(_ grid: [[Int]]) -> Node? {
    func isUniform(_ r: Int, _ c: Int, _ size: Int) -> Bool {
        let value = grid[r][c]

        for i in r..<r + size {
            for j in c..<c + size {
                if grid[i][j] != value { return false }
            }
        }

        return true
    }

    func constructQuadTree(_ r: Int, _ c: Int, _ size: Int) -> Node? {
        if size == 0 { return nil }
        if isUniform(r, c, size) { return Node(grid[r][c] == 1, true) }

        let mid = size / 2
        let topLeft = constructQuadTree(r, c, mid)
        let topRight = constructQuadTree(r, c + mid, mid)
        let bottomLeft = constructQuadTree(r + mid, c, mid)
        let bottomRight = constructQuadTree(r + mid, c + mid, mid)
        let new = Node(true, false)

        new.topLeft = topLeft
        new.topRight = topRight
        new.bottomLeft = bottomLeft
        new.bottomRight = bottomRight

        return new
    }

    return constructQuadTree(0, 0, grid.count)
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