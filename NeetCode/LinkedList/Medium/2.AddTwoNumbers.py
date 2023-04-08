# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order, and each of their nodes contains a single digit. 
# Add the two numbers and return the sum as a linked list.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def addTwoNumbers(l1, l2):
    new_node = ListNode(val=0, next=None)
    current = new_node

    carry = 0

    while l1 or l2 or carry:
        value1 = l1.val if l1 else 0
        value2 = l2.val if l2 else 0

        total = value1 + value2 + carry
        carry = total//10
        total = total%10
        current.next = ListNode(total)

        current = current.next
        l1 = l1.next if l1 else None
        l2 = l2.next if l2 else None

    return new_node.next
