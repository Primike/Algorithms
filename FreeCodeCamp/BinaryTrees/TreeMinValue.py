from json.encoder import INFINITY
class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

a, b, c, d, e, f = Node(1), Node(2), Node(3), Node(4), Node(5), Node(6)
a.left, a.right, b.left, b.right, c.right = b, c, d, e, f

def treeMinValue(root):
    smallest = INFINITY
    stack = [ root ]

    while len(stack) > 0:
        current = stack.pop(len(stack) - 1)
        
        if current.val < smallest:
            smallest = current.val
        if current.left != None:
            stack.append(current.left)
        if current.right != None:
            stack.append(current.right)

    return smallest

print(treeMinValue(a))



def treeMinValueRecursion(root):
    if root == None:
        return INFINITY

    leftMin = treeMinValueRecursion(root.left)
    rightMin = treeMinValueRecursion(root.right)

    return min([root.val, leftMin, rightMin])


print(treeMinValueRecursion(a))


