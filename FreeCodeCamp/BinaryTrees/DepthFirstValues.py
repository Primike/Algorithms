class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

a, b, c, d, e, f = Node("A"), Node("B"), Node("C"), Node("D"), Node("E"), Node("F")
a.left, a.right, b.left, b.right, c.right = b, c, d, e, f

def depthFirstValues(root):
    if root == None:
        return 
        
    stack = [ root ]
    result = []

    while len(stack) > 0:
        current = stack.pop()
        result.append(current.val)

        if current.right:
            stack.append(current.right)

        if current.left:
            stack.append(current.left)

    return result

print(depthFirstValues(a))


def depthFirstValuesRecursion(root):
    if root == None:
        return []

    leftValues = depthFirstValuesRecursion(root.left)
    rightValues = depthFirstValuesRecursion(root.right)

    return [root.val] + leftValues + rightValues

print(depthFirstValuesRecursion(a))



