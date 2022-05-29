class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def linkedListValues(head):
    values = []
    current = head

    while current != None:
        values.append(current.val)
        current = current.next

    return values

print(linkedListValues(a))



def linkedListValuesRecursion(head, values = []):
    if head == None:
        return

    values.append(head.val)
    linkedListValuesRecursion(head.next, values)

    return values

print(linkedListValuesRecursion(a))