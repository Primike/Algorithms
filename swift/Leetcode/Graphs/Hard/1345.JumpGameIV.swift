class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        if n <= 1 { return 0 }

        var graph = [Int: [Int]]()
        for i in 0..<n {
            graph[arr[i], default: []].append(i)
        }

        var curs = Set<Int>([0])
        var visited = Set<Int>([0, n - 1])
        var other = Set<Int>([n - 1])
        var step = 0

        while !curs.isEmpty {
            if curs.count > other.count {
                let temp = curs
                curs = other
                other = temp
            }
            
            var nex = Set<Int>()

            for node in curs {
                if let children = graph[arr[node]] {
                    for child in children {
                        if other.contains(child) {
                            return step + 1
                        }
                        if !visited.contains(child) {
                            visited.insert(child)
                            nex.insert(child)
                        }
                    }
                }
                
                graph[arr[node]] = []

                for child in [node - 1, node + 1] {
                    if other.contains(child) {
                        return step + 1
                    }
                    if child >= 0 && child < n && !visited.contains(child) {
                        visited.insert(child)
                        nex.insert(child)
                    }
                }
            }

            curs = nex
            step += 1
        }

        return -1
    }
}