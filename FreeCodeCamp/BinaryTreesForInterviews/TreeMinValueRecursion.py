from BinaryTreeClass import root_node

def treeMinValueRecursion(root):
    if root == None:
        return float('inf')

    leftMin = treeMinValueRecursion(root.left)
    rightMin = treeMinValueRecursion(root.right)

    return min([root.val, leftMin, rightMin])


print(treeMinValueRecursion(root_node))
