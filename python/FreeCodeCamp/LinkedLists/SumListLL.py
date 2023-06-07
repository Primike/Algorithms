from Node import node_a

def sumList(head):
    sum = 0
    current = head
    while current != None:
        sum += current.num
        current = current.next

    return sum

print(sumList(node_a))



def sumListRecursion(head):
    if head == None:
        return 0

    return head.num + sumListRecursion(head.next)

print(sumListRecursion(node_a))