// You are given two integers m and n, which represent 
// the dimensions of a matrix.
// You are also given the head of a linked list of integers.
// Generate an m x n matrix that contains the integers in 
// the linked list presented in spiral order (clockwise), 
// starting from the top-left of the matrix. 
// If there are remaining empty spaces, fill them with -1.
// Return the generated matrix.

// Time: O(m * n), Space: O(m * n)
func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var result = Array(repeating: Array(repeating: -1, count: n), count: m)
    var visited = Set<[Int]>()
    var current = head
    var index = 0
    var i = 0, j = 0

    while let node = current {
        result[i][j] = node.val
        visited.insert([i, j])
        current = node.next
        
        let r = i + directions[index].0
        let c = j + directions[index].1
        
        if r < 0 || r >= m || c < 0 || c >= n || visited.contains([r, c]) {
            index = (index + 1) % 4
        }
        
        i += directions[index].0
        j += directions[index].1
    }

    return result
}