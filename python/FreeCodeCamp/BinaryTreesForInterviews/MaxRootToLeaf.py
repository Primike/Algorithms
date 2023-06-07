from BinaryTreeClass import root_node

def maxPathSum(root):
    if root == None:
        return float('-inf')
    if root.left == None and root.right == None:
        return root.val
    
    maxChildPathSum = max([maxPathSum(root.left), maxPathSum(root.right)])
    return root.val + maxChildPathSum

print(maxPathSum(root_node))