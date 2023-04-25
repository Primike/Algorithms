# Given the root of a binary tree, return the inorder traversal of its nodes' values.

class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def inorderTraversal(root):
    result, stack = [], []
    current = root

    while current or stack:
        while current:
            stack.append(current)
            current = current.left

        current = stack.pop()
        result.append(current.val)
        current = current.right

    return result


def inorderTraversalR(root):
    result = []

    def helper(root):
        if not root:
            return

        helper(root.left)
        result.append(root.val)
        helper(root.right)

    helper(root)
    
    return result
