class Trie {
    var serial: String = ""
    var children: [String: Trie] = [:]
}

class Solution {
    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        let root = Trie()

        for path in paths {
            var cur = root
            for node in path {
                if cur.children[node] == nil {
                    cur.children[node] = Trie()
                }
                cur = cur.children[node]!
            }
        }

        var freq: [String: Int] = [:]

        func construct(_ node: Trie) {
            if node.children.isEmpty {
                return
            }

            var v: [String] = []
            for (folder, child) in node.children {
                construct(child)
                v.append("\(folder)(\(child.serial))")
            }
            
            v.sort()
            node.serial = v.joined()
            freq[node.serial, default: 0] += 1
        }

        construct(root)

        var ans: [[String]] = []
        var path: [String] = []

        func operate(_ node: Trie) {
            if freq[node.serial, default: 0] > 1 {
                return
            }
            
            if !path.isEmpty {
                ans.append(path)
            }

            for (folder, child) in node.children {
                path.append(folder)
                operate(child)
                path.removeLast()
            }
        }
        
        operate(root)
        return ans
    }
}