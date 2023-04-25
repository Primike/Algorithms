# You are given the head of a singly linked-list. The list can be represented as:
# L0 → L1 → … → Ln - 1 → Ln
# Reorder the list to be on the following form:
# L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reorderList(head):
    slow, fast = head, head

    while fast and fast.next:
        fast = fast.next.next
        slow = slow.next

    previous = None
    while slow:
        next_node = slow.next
        slow.next = previous
        previous = slow
        slow = next_node

    left, right = head, previous
    
    while right and right.next:
        next_node_right = right.next
        next_node_left = left.next
        left.next = right
        right.next = next_node_left
        right = next_node_right
        left = next_node_left

    return head
