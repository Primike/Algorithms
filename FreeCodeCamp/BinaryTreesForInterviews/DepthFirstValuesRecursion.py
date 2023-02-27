from BinaryTreeClass import root_node

def depthFirstValuesRecursion(root):
    if root == None:
        return []

    leftValues = depthFirstValuesRecursion(root.left)
    rightValues = depthFirstValuesRecursion(root.right)

    return [root.val] + leftValues + rightValues

print(depthFirstValuesRecursion(root_node))
