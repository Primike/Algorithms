class LockingTree {
    let parent: [Int]
    var locked: [Int: Int]
    var edges: [[Int]]

    init(_ parent: [Int]) {
        self.parent = parent
        self.locked = [:]
        self.edges = Array(repeating: [Int](), count: parent.count)

        for (i, n) in parent.enumerated() {
            if n != -1 { edges[n].append(i) }
        }
    }
    
    func lock(_ num: Int, _ user: Int) -> Bool {
        if locked.keys.contains(num) { return false }

        locked[num] = user
        return true
    }
    
    func unlock(_ num: Int, _ user: Int) -> Bool {
        if !locked.keys.contains(num) { return false }

        if locked[num]! == user {
            locked.removeValue(forKey: num)
            return true
        } else {
            return false
        }
    }
    
    func upgrade(_ num: Int, _ user: Int) -> Bool {
        if locked.keys.contains(num) { return false }
        if !checkAncestors(num) { return false }
        if !checkAndUnlockDecendants(num) { return false }

        locked[num] = user
        return true
    }

    func checkAncestors(_ n: Int) -> Bool {
        var current = n

        while current != -1 {
            let ancestor = parent[current]
            if locked.keys.contains(ancestor) { return false }
            current = ancestor
        }

        return true
    }

    func checkAndUnlockDecendants(_ n: Int) -> Bool {
        var queue = [n]
        var isLocked = false

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                if locked.keys.contains(first) { isLocked = true }
                locked.removeValue(forKey: first)

                for node in edges[first] {
                    queue.append(node)
                }
            }
        }

        return isLocked
    }
}