class LockingTree {

    var locks: [Int: Int]
    var paths: [[Int]]
    var parent: [Int]

    init(_ parent: [Int]) {
        self.locks = [:]
        self.paths = Array(repeating: [], count: parent.count)
        self.parent = parent

        for (i, node) in parent.enumerated() {
            if node == -1 { continue }
            paths[node].append(i)
        }
    }
    
    func lock(_ num: Int, _ user: Int) -> Bool {
        if locks.keys.contains(num) { return false }

        locks[num] = user
        return true
    }
    
    func unlock(_ num: Int, _ user: Int) -> Bool {
        if let value = locks[num], user == value {
            locks[num] = nil
            return true
        }

        return false
    }
    
    func upgrade(_ num: Int, _ user: Int) -> Bool {
        var current = num

        while current != -1 {
            if locks.keys.contains(current) { return false }
            current = parent[current]
        }

        var queue = [num], locked = false

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()

                for node in paths[first] {
                    queue.append(node)
                    if locks.keys.contains(node) {
                        locked = true
                        locks[node] = nil
                    }
                }
            }
        }

        if locked == false { return false }

        locks[num] = user
        return true
    }
}