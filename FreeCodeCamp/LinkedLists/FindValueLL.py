class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def linkedListFind(head, target):
    current = head
    
    while current != None:
        if current.val == target:
            return True
        
        current = current.next

    return False

print(linkedListFind(a, "B"))




def linkedListFindRecursion(head, target):
    if head == None:
        return False

    if head.val == target:
        return True

    return linkedListFind(head.next, target)

print(linkedListFindRecursion(a, "B"))