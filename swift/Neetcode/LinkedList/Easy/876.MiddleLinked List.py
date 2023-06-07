# Given the head of a singly linked list, return the middle node of the linked list.
# If there are two middle nodes, return the second middle node.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def middleNode(head):
    slow, fast = head, head

    while fast and fast.next:
        fast = fast.next.next
        slow = slow.next

    return slow
