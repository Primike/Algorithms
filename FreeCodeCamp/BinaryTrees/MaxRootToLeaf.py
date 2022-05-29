from json.encoder import INFINITY

class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

a, b, c, d, e, f = Node(1), Node(2), Node(3), Node(4), Node(5), Node(6)
a.left, a.right, b.left, b.right, c.right = b, c, d, e, f

def maxPathSum(root):
    if root == None:
        return -INFINITY
    if root.left == None and root.right == None:
        return root.val
    
    maxChildPathSum = max([maxPathSum(root.left), maxPathSum(root.right)])
    return root.val + maxChildPathSum

print(maxPathSum(a))