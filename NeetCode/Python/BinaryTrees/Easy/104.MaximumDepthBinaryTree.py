# Given the root of a binary tree, return its maximum depth.

class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def maxDepth(root):
    if not root:
        return 0

    return 1 + max(maxDepth(root.left), maxDepth(root.right))
