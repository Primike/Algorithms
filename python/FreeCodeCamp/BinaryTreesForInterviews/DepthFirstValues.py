from BinaryTreeClass import root_node

def depthFirstValues(root):
    if root == None:
        return 
        
    result = []
    stack = [ root ]

    while len(stack) > 0:
        current = stack.pop()
        result.append(current.val)

        if current.right:
            stack.append(current.right)

        if current.left:
            stack.append(current.left)

    return result

print(depthFirstValues(root_node))



def depthFirstValuesRecursion(root):
    if root == None:
        return []

    leftValues = depthFirstValuesRecursion(root.left)
    rightValues = depthFirstValuesRecursion(root.right)

    return [root.val] + leftValues + rightValues

print(depthFirstValuesRecursion(root_node))
