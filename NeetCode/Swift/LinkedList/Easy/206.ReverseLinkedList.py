# Given the head of a singly linked list, reverse the list, 
# and return the reversed list.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


def reverseList(head):
    current = head
    previous = None

    while current:
        next_node = current.next

        current.next = previous

        previous = current
        current = next_node

    return previous

#[1,2,3,4,5]