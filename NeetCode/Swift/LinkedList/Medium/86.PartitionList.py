# Given the head of a linked list and a value x, 
# partition it such that all nodes less than x come before nodes 
# greater than or equal to x.
# You should preserve the original relative order of the nodes 
# in each of the two partitions.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def partition(head, x):
    left_list, right_list = ListNode(), ListNode()
    left, right = left_list, right_list

    while head:
        if head.val < x:
            left.next = head
            left = left.next
        else:
            right.next = head
            right = right.next

        head = head.next

    left.next = right_list.next
    right.next = None

    return left_list.next
