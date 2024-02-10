// Given an m x n integer matrix heightMap representing the 
// height of each unit cell in a 2D elevation map, 
// return the volume of water it can trap after raining.

func trapRainWater(_ heightMap: [[Int]]) -> Int {
    let m = heightMap.count, n = heightMap[0].count
    
    if m < 3 || n < 3 { return 0 }

    var heap = Heap<Point>(.minHeap) 
    var visited = Set<String>()

    for i in 0..<m {
        heap.push(Point(i: i, j: 0, height: heightMap[i][0]))
        heap.push(Point(i: i, j: n - 1, height: heightMap[i][n - 1]))
        visited.insert("\(i),\(0)")
        visited.insert("\(i),\(n - 1)")
    }

    for j in 1..<(n - 1) {
        heap.push(Point(i: 0, j: j, height: heightMap[0][j]))
        heap.push(Point(i: m - 1, j: j, height: heightMap[m - 1][j]))
        visited.insert("\(0),\(j)")
        visited.insert("\(m - 1),\(j)")
    }

    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    var result = 0

    while !heap.isEmpty {
        let point = heap.pop()!

        for (di, dj) in directions {
            let r = point.i + di, c = point.j + dj
            let key = "\(r),\(c)"

            if r < 0 || r >= m || c < 0 || c >= n { continue }
            if visited.contains(key) { continue }

            result += max(0, point.height - heightMap[r][c])
            heap.push(Point(i: r, j: c, height: max(heightMap[r][c], point.height)))  
            visited.insert(key)              
        }
    }

    return result
}

print(trapRainWater([[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]))
print(trapRainWater([[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]]))