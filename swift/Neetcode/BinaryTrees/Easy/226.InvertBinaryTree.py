# Given the root of a binary tree, invert the tree, and return its root.

class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def invertTree(root):
    if not root:
        return None
        
    left_tree = root.left
    root.left = root.right
    root.right = left_tree

    invertTree(root.left)
    invertTree(root.right)

    return root

