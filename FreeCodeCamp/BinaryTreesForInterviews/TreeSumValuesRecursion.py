from BinaryTreeClass import root_node

def treeSumRecursion(root):
    if root == None:
        return 0

    return root.val + treeSumRecursion(root.left) + treeSumRecursion(root.right)

print(treeSumRecursion(root_node))