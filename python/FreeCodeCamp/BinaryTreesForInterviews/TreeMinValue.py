from BinaryTreeClass import root_node

def treeMinValue(root):
    smallest = float('inf')
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

print(treeMinValue(root_node))



def treeMinValueRecursion(root):
    if root == None:
        return float('inf')

    leftMin = treeMinValueRecursion(root.left)
    rightMin = treeMinValueRecursion(root.right)

    return min([root.val, leftMin, rightMin])


print(treeMinValueRecursion(root_node))
