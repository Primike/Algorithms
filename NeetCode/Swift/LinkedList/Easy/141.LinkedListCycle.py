# Given head, the head of a linked list, determine if the linked list has a cycle.

class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

def hasCycle(head):
    slow, fast = head, head

    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next

        if slow == fast:
            return True

    return False
