# Given the head of a linked list, remove the nth node from the end of the list 
# and return its head.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def removeNthFromEnd(head, n):
    new_node = ListNode(val=0, next=head)
    left, right = new_node, head

    while n > 0 and right:
        right = right.next
        n -= 1

    while right:
        left = left.next
        right = right.next

    left.next = left.next.next
    return new_node.next
