class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def reverseList(head):
    prev = None
    current = head

    while current != None:
        next = current.next
        current.next = prev
        prev = current
        current = next

    return prev

print(reverseList(a).val)


def reverseListRecursion(head, prev = None):
    if head == None:
        return prev

    next = head.next
    return reverseListRecursion(next, head)

print(reverseListRecursion(a).val)