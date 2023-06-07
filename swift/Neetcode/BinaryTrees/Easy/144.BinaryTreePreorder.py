# Given the root of a binary tree, return the preorder traversal of its nodes' values.

class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def preorderTraversal(root):
    current, stack = root, []
    result = []

    while current or stack:
        if current:
            result.append(current.val)
            stack.append(current.right)
            current = current.left
        else:
            current = stack.pop()

    return result
