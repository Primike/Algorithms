
class TrieNode {
    var map: [String: TrieNode]
    var name: String
    var value: Int

    init(_ name: String) {
        self.map = [:]
        self.name = name
        self.value = -1
    }
}

class FileSystem {

    let root: TrieNode

    init() {
        self.root = TrieNode("")
    }

    func createPath(_ path: String, _ value: Int) -> Bool {
        let components = path.components(separatedBy: "/")
        var cur = self.root

        for i in 1..<components.count {
            let name = components[i]

            if cur.map[name] == nil {
                if i == components.count - 1 {
                    cur.map[name] = TrieNode(name)
                } else {
                    return false
                }
            }
            cur = cur.map[name]!
        }

        if cur.value != -1 {
            return false
        }

        cur.value = value
        return true
    }

    func get(_ path: String) -> Int {
        var cur = self.root
        let components = path.components(separatedBy: "/")

        for i in 1..<components.count {
            let name = components[i]
            guard let nextNode = cur.map[name] else {
                return -1
            }
            cur = nextNode
        }
        return cur.value
    }
}