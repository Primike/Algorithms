from Node import node_a

def reverseList(head):
    prev = None
    current = head

    while current != None:
        next = current.next
        current.next = prev
        prev = current
        current = next

    return prev

print(reverseList(node_a).val)



def reverseListRecursion(head, prev = None):
    if head == None:
        return prev

    next = head.next
    head.next = prev
    return reverseListRecursion(next, head)

print(reverseListRecursion(node_a).val)