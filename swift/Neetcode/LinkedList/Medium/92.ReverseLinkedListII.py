# Given the head of a singly linked list and two integers left and 
# right where left <= right, reverse the nodes of the list from 
# position left to position right, and return the reversed list.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reverseBetween(head, left, right):
    new_node = ListNode(val=0, next=head)
    previous, current = new_node, head

    for i in range(left - 1):
        previous = current 
        current = current.next

    last_node = None
    for i in range(right - left + 1):
        next_node = current.next
        current.next = last_node
        last_node = current
        current = next_node

    previous.next.next = current
    previous.next = last_node

    return new_node.next
