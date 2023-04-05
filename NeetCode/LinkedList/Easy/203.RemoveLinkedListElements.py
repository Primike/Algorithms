# Given the head of a linked list and an integer val, 
# remove all the nodes of the linked list that has Node.val == val, 
# and return the new head.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def removeElements(head, val):
    new_list = ListNode(next=head)
    previous = new_list
    current = head

    while current:
        if current.val == val:
            previous.next = current.next
        else:
            previous = current
        
        current = current.next

    return new_list.next
