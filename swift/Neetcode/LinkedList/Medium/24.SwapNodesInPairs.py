# Given a linked list, swap every two adjacent nodes and return its head. 
# You must solve the problem without modifying the values 
# in the list's nodes (i.e., only nodes themselves may be changed.)

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def swapPairs(head):
    new_node = ListNode(val=0, next=head)
    previous, current = new_node, head

    while current and current.next:
        next_pair = current.next.next
        next_node = current.next

        previous.next = next_node
        next_node.next = current
        current.next = next_pair

        previous = current
        current = next_pair
        
    return new_node.next
