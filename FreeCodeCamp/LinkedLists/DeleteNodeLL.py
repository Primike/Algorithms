class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def deleteNodeAt(head, index):
    if index == 0:
        head.next = None
        return
    
    current = head

    while index != 1:
        if current.next.next != None:
            current = current.next
            index = index - 1
        else:
            return

    next = current.next
    current.next = next.next
    next.next = None

    return head

print(deleteNodeAt(a, 1).next.val)