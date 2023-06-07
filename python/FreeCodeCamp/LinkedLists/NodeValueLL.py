from Node import node_a

def getNodeValue(head, index):
    current = head
    count = 0
    while current != None:
        if count == index: 
            return current.val

        count += 1
        current = current.next

print(getNodeValue(node_a, 2))



def getNodeValueRecursion(head, index):
    if head == None:
        return None

    if index == 0:
        return head.val

    return getNodeValueRecursion(head.next, index - 1)

print(getNodeValueRecursion(node_a, 2))