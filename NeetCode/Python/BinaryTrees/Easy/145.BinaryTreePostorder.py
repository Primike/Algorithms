# Given the root of a binary tree, return the postorder traversal of its nodes' values.

class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def postorderTraversal(root):
    stack = [root]
    visit = [False]
    result = []

    while stack:
        current, visited = stack.pop(), visit.pop()

        if current:
            if visited:
                result.append(current.val)
            else:
                stack.append(current)
                visit.append(True)
                stack.append(current.right)
                visit.append(False)
                stack.append(current.left)
                visit.append(False)

    return result
