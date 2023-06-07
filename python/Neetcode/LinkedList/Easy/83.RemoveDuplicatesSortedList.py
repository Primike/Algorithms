# Given the head of a sorted linked list, 
# delete all duplicates such that each element appears only once. 
# Return the linked list sorted as well.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def deleteDuplicates(head):
    current = head

    while current:
        while current.next and current.next.val == current.val:
            current.next = current.next.next

        current = current.next   
                
    return head
