class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c
z = Node("Z", 10)

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

print(insertNodeAt(a, 2, z).next.next.val)
