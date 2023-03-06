from Node import Node, node_a

def insertNodeAt(head, index, node):
    if index == 0:
        node.next = head
        return node
    
    last = head
    next = head.next

    while index != 1:
        last = last.next
        next = next.next
        index = index - 1

    last.next = node
    node.next = next
    return head


node_z = Node("Z", 10)
print(insertNodeAt(node_a, 2, node_z).next.next.val)
