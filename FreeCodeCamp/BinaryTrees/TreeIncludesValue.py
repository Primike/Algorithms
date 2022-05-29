class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

a, b, c, d, e, f = Node("A"), Node("B"), Node("C"), Node("D"), Node("E"), Node("F")
a.left, a.right, b.left, b.right, c.right = b, c, d, e, f

def treeIncludes(root, target):
    if root == None:
        return False

    queue = [ root ]
    while len(queue) > 0:
        current = queue.pop(0)
        if current.val == target:
            return True
        if current.left:
            queue.append(current.left)
        if current.right:
            queue.append(current.right)
    return False

print(treeIncludes(a, "F"))




def treeIncludesRecursion(root, target):
    if root == None:
        return False
    if root.val == target:
        return True

    return treeIncludesRecursion(root.left, target) or treeIncludesRecursion(root.right, target)

print(treeIncludesRecursion(a, "cc"))