class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def getNodeValue(head, index):
    current = head
    count = 0
    while current != None:
        if count == index: 
            return current.val

        count += 1
        current = current.next

print(getNodeValue(a, 2))



def getNodeValueRecursion(head, index):
    if head == None:
        return None

    if index == 0:
        return head.val

    return getNodeValueRecursion(head.next, index - 1)

print(getNodeValueRecursion(a, 2))