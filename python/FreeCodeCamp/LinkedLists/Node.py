class Node:
    def __init__(self, val, num):
        self.val = val
        self.num = num 
        self.next = None

node_a, node_b, node_c = Node("A", 1), Node("B", 2), Node("C", 3)
node_a.next, node_b.next = node_b, node_c
