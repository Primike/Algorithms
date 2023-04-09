# Given the head of a linked list, rotate the list to the right by k places.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def rotateRight(head, k):
    if not head:
        return head

    length, end_node = 1, head
    while end_node.next:
        length += 1
        end_node = end_node.next

    if k % length == 0:
        return head

    current = head
    for i in range(length - k % length - 1):
        current = current.next

    new_node = current.next
    end_node.next = head
    current.next = None

    return new_node
