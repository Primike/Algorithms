class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

a, b, c, d, e, f = Node(1), Node(2), Node(3), Node(4), Node(5), Node(6)
a.left, a.right, b.left, b.right, c.right = b, c, d, e, f

def treeSum(root):
    if root == None:
        return 0
    totalSum = 0
    queue = [ root ]

    while len(queue) > 0:
        current = queue.pop(0)
        totalSum += current.val

        if current.left != None:
            queue.append(current.left)
        if current.right != None:
            queue.append(current.right)

    return totalSum

print(treeSum(a))

def treeSumRecursion(root):
    if root == None:
        return 0

    return root.val + treeSum(root.left) + treeSum(root.right)

print(treeSumRecursion(a))