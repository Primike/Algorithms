class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def sumList(head):
    sum = 0
    current = head
    while current != None:
        sum += current.num
        current = current.next

    return sum

print(sumList(a))

def sumListRecursion(head):
    if head == None:
        return 0

    return head.num + sumListRecursion(head.next)

print(sumListRecursion(a))