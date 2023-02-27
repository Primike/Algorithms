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