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
    if s.count == 0 { return nil }
    
    let s = Array(s)
    var i = 0

    func dfs() -> TreeNode? {
        var isPositive = true

        if s[i] == "-" {
            i += 1
            isPositive = false
        }

        var number = 0

        while i < s.count, let digit = s[i].wholeNumberValue {
            number = (number * 10) + digit
            i += 1
        }

        let newNode = TreeNode(number * (isPositive ? 1 : -1))
        
        if i < s.count, s[i] == "(" {
            i += 1
            newNode.left = dfs()
            i += 1
        }

        if i < s.count, s[i] == "(" {
            i += 1
            newNode.right = dfs()
            i += 1
        }

        return newNode
    }

    return dfs()
}