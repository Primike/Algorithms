class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

a, b, c, d, e, f = Node("A"), Node("B"), Node("C"), Node("D"), Node("E"), Node("F")
a.left, a.right, b.left, b.right, c.right = b, c, d, e, f

def breadthFirstValues(root):
    if root == None:
        return []

    values = []
    queue = [ root ]

    while  len(queue) > 0:
        current = queue.pop(0)
        values.append(current.val)

        if current.left != None:
            queue.append(current.left)
        if current.right != None:
            queue.append(current.right)

    return values

print(breadthFirstValues(a))
