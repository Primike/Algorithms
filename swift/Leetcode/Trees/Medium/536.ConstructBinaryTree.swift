// You need to construct a binary tree from a string 
// consisting of parenthesis and integers.
// The whole input represents a binary tree. 
// It contains an integer followed by zero, one or two 
// pairs of parenthesis. The integer represents the root's value 
// and a pair of parenthesis contains a child binary tree 
// with the same structure.
// You always start to construct the left child node 
// of the parent first if it exists.

// Time: O(n), Space: O(h)
func str2tree(_ s: String) -> TreeNode? {
    let s = Array(s)

    func dfs(_ l: Int, _ r: Int) -> TreeNode? {
        if l > r { return nil }

        var isNegative = false
        var l1 = l

        if s[l1] == "-" { 
            isNegative = true
            l1 += 1
        }

        var string = ""

        while l1 <= r, s[l1].isNumber {
            string.append(s[l1])
            l1 += 1
        }

        guard var number = Int(string) else { return nil }

        let newNode = TreeNode(number * (isNegative ? -1 : 1))
        var r1 = l1 + 1
        var opened = 1 

        while r1 <= r, opened > 0 {
            if s[r1] == "(" { opened += 1 }
            if s[r1] == ")" { opened -= 1 }
            r1 += 1
        }

        newNode.left = dfs(l1 + 1, r1 - 2)
        let l2 = r1 
        var r2 = l2 + 1
        opened = 1

        while r2 <= r, opened > 0 {
            if s[r2] == "(" { opened += 1 }
            if s[r2] == ")" { opened -= 1 }
            r2 += 1
        }

        newNode.right = dfs(l2 + 1, r2 - 2)

        return newNode
    }
    
    return dfs(0, s.count - 1)
}