class Solution {
    private struct Node {
        var maxLen: Int = 0
        var prefixLen: Int = 0
        var suffixLen: Int = 0
        var leftChar: Character = " "
        var rightChar: Character = " "
    }
    
    private var tree: [Node] = []
    private var sChars: [Character] = []
    
    private func merge(_ left: Node, _ right: Node, _ leftLen: Int, _ rightLen: Int) -> Node {
        var res = Node()
        res.leftChar = left.leftChar
        res.rightChar = right.rightChar
        res.maxLen = max(left.maxLen, right.maxLen)
        
        if left.rightChar == right.leftChar {
            res.maxLen = max(res.maxLen, left.suffixLen + right.prefixLen)
        }
        
        res.prefixLen = left.prefixLen
        if left.prefixLen == leftLen && left.rightChar == right.leftChar {
            res.prefixLen = left.prefixLen + right.prefixLen
        }
        
        res.suffixLen = right.suffixLen
        if right.suffixLen == rightLen && left.rightChar == right.leftChar {
            res.suffixLen = left.suffixLen + right.suffixLen
        }
        
        return res
    }
    
    private func build(_ node: Int, _ l: Int, _ r: Int) {
        if l == r {
            let ch = sChars[l]
            tree[node] = Node(maxLen: 1, prefixLen: 1, suffixLen: 1, leftChar: ch, rightChar: ch)
            return
        }
        let mid = l + (r - l) / 2
        build(2 * node, l, mid)
        build(2 * node + 1, mid + 1, r)
        
        let leftLen = mid - l + 1
        let rightLen = r - mid
        tree[node] = merge(tree[2 * node], tree[2 * node + 1], leftLen, rightLen)
    }
    
    private func update(_ node: Int, _ l: Int, _ r: Int, _ pos: Int, _ ch: Character) {
        if l == r {
            sChars[pos] = ch
            tree[node] = Node(maxLen: 1, prefixLen: 1, suffixLen: 1, leftChar: ch, rightChar: ch)
            return
        }
        let mid = l + (r - l) / 2
        if pos <= mid {
            update(2 * node, l, mid, pos, ch)
        } else {
            update(2 * node + 1, mid + 1, r, pos, ch)
        }
        
        let leftLen = mid - l + 1
        let rightLen = r - mid
        tree[node] = merge(tree[2 * node], tree[2 * node + 1], leftLen, rightLen)
    }
    
    func longestRepeating(_ s: String, _ queryCharacters: String, _ queryIndices: [Int]) -> [Int] {
        sChars = Array(s)
        let n = sChars.count
        if n == 0 { return [] }
        
        tree = Array(repeating: Node(), count: 4 * n)
        build(1, 0, n - 1)
        
        let qChars = Array(queryCharacters)
        let k = queryIndices.count
        var ans = [Int]()
        ans.reserveCapacity(k)
        
        for i in 0..<k {
            let pos = queryIndices[i]
            let ch = qChars[i]
            update(1, 0, n - 1, pos, ch)
            ans.append(tree[1].maxLen)
        }
        
        return ans
    }
}