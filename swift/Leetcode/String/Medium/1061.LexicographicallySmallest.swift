class Solution {
    func DFS(_ src: Int, _ adjMatrix: inout [[Int]], _ visited: inout [Bool], _ component: inout [Int], _ minChar: inout Int) {
        visited[src] = true
        component.append(src)
        minChar = min(minChar, src)
        for i in 0..<26 where adjMatrix[src][i] == 1 && !visited[i] {
            DFS(i, &adjMatrix, &visited, &component, &minChar)
        }
    }
    
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        var adjMatrix = Array(repeating: Array(repeating: 0, count: 26), count: 26)
        let aScalar: UInt8 = 97
        let s1Bytes = Array(s1.utf8)
        let s2Bytes = Array(s2.utf8)
        for i in 0..<s1Bytes.count {
            let u = Int(s1Bytes[i] - aScalar)
            let v = Int(s2Bytes[i] - aScalar)
            adjMatrix[u][v] = 1
            adjMatrix[v][u] = 1
        }
        
        var mappingChar = Array(0..<26)
        var visited = Array(repeating: false, count: 26)
        
        for c in 0..<26 where !visited[c] {
            var component: [Int] = []
            var minChar = 27
            DFS(c, &adjMatrix, &visited, &component, &minChar)
            for v in component {
                mappingChar[v] = minChar
            }
        }
        
        var resultBytes: [UInt8] = []
        for byte in baseStr.utf8 {
            let mapped = UInt8(mappingChar[Int(byte - aScalar)] + Int(aScalar))
            resultBytes.append(mapped)
        }
        return String(bytes: resultBytes, encoding: .utf8)!
    }
}