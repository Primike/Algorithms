class Node:
    def __init__(self, val):
        self.val = val
        self.right = None
        self.left = None

root_node = Node(1)
node_2 = Node(2)
node_3 = Node(3)
node_4 = Node(4)
node_5 = Node(5)
node_6 = Node(6)

root_node.left = node_2
root_node.right = node_3
node_2.left = node_4    
node_2.right = node_5
node_3.right = node_6
