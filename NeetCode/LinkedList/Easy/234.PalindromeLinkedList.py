# Given the head of a singly linked list, return true if it is a 
# palindrome or false otherwise.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def isPalindrome(head):
    slow, fast = head, head

    while fast and fast.next:
        fast = fast.next.next
        slow = slow.next

    previous_node = None
    while slow:
        next_node = slow.next
        slow.next = previous_node
        previous_node = slow
        slow = next_node

    left, right = head, previous_node
    while right:
        if left.val != right.val:
            return False
        
        left = left.next
        right = right.next

    return True
