class DSU {
    var parent: [Int]

    init(_ size: Int) {
        self.parent = Array(0..<size)
    }

    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    func join(_ u: Int, _ v: Int) {
        parent[find(v)] = find(u)
    }
}

class Solution {
    func processQueries(_ c: Int, _ connections: [[Int]], _ queries: [[Int]]) -> [Int] {
        var dsu = DSU(c + 1)
        for p in connections {
            dsu.join(p[0], p[1])
        }

        var online = [Bool](repeating: true, count: c + 1)
        var offline_counts = [Int](repeating: 0, count: c + 1)
        var minimum_online_stations = [Int: Int]()

        for q in queries {
            let op = q[0]
            let x = q[1]
            if op == 2 {
                online[x] = false
                offline_counts[x] += 1
            }
        }

        for i in 1...c {
            let root = dsu.find(i)
            if minimum_online_stations[root] == nil {
                minimum_online_stations[root] = -1
            }

            let station = minimum_online_stations[root] ?? -1
            if online[i] {
                if station == -1 || station > i {
                    minimum_online_stations[root] = i
                }
            }
        }

        var ans = [Int]()
        for i in stride(from: queries.count - 1, through: 0, by: -1) {
            let op = queries[i][0]
            let x = queries[i][1]
            let root = dsu.find(x)
            let station = minimum_online_stations[root] ?? -1

            if op == 1 {
                if online[x] {
                    ans.append(x)
                } else {
                    ans.append(station)
                }
            }

            if op == 2 {
                if offline_counts[x] > 1 {
                    offline_counts[x] -= 1
                } else {
                    online[x] = true
                    if station == -1 || station > x {
                        minimum_online_stations[root] = x
                    }
                }
            }
        }

        return ans.reversed()
    }
}