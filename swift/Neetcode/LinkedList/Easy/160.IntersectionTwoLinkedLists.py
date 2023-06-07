# Given the heads of two singly linked-lists headA and headB, 
# return the node at which the two lists intersect. 
# If the two linked lists have no intersection at all, return null.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def getIntersectionNode(headA, headB):
    list_a, list_b = headA, headB

    while list_a != list_b:
        list_a = list_a.next if list_a else headB
        list_b = list_b.next if list_b else headA

    return list_a
