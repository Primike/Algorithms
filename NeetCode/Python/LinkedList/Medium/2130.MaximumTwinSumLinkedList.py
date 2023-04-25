# For example, if n = 4, then node 0 is the twin of node 3, 
# and node 1 is the twin of node 2. These are the only nodes with twins for n = 4.
# The twin sum is defined as the sum of a node and its twin.
# Given the head of a linked list with even length, return the maximum twin sum of the linked list.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def pairSum(head):
    slow, fast = head, head
    previous = None

    while fast and fast.next:
        fast = fast.next.next
        next_node = slow.next
        slow.next = previous
        previous = slow
        slow = next_node

    result = 0
    while slow:
        result = max(result, previous.val + slow.val)
        previous = previous.next
        slow = slow.next
    
    return result
