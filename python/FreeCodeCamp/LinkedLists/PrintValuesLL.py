from Node import node_a

def linkedListValues(head):
    values = []
    current = head

    while current != None:
        values.append(current.val)
        current = current.next

    return values

print(linkedListValues(node_a))



def linkedListValuesRecursion(head, values = []):
    if head == None:
        return

    values.append(head.val)
    linkedListValuesRecursion(head.next, values)

    return values

print(linkedListValuesRecursion(node_a))