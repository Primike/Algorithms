from Node import node_a

def linkedListFind(head, target):
    current = head
    
    while current != None:
        if current.val == target:
            return True
        
        current = current.next

    return False

print(linkedListFind(node_a, "B"))




def linkedListFindRecursion(head, target):
    if head == None:
        return False

    if head.val == target:
        return True

    return linkedListFind(head.next, target)

print(linkedListFindRecursion(node_a, "B"))