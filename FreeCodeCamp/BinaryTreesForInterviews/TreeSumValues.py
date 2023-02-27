from BinaryTreeClass import root_node

def treeSum(root):
    if root == None:
        return 0
    totalSum = 0
    queue = [ root ]

    while len(queue) > 0:
        current = queue.pop(0)
        totalSum += current.val

        if current.left != None:
            queue.append(current.left)
        if current.right != None:
            queue.append(current.right)

    return totalSum

print(treeSum(root_node))