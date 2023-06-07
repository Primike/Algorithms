from Node import node_a

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

print(deleteNodeAt(node_a, 1).next.val)