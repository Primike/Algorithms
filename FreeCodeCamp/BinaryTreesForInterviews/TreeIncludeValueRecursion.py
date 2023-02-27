from BinaryTreeClass import root_node

def treeIncludesRecursion(root, target):
    if root == None:
        return False
    if root.val == target:
        return True

    return treeIncludesRecursion(root.left, target) or treeIncludesRecursion(root.right, target)

print(treeIncludesRecursion(root_node, 3))