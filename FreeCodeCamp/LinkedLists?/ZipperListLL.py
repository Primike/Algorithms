class Node:
    def __init__(self, val, num):
        self.val, self.num, self.next = val, num, None

a, b, c = Node("A", 1), Node("B", 2), Node("C", 3)
a.next, b.next = b, c

def zipperLists(head1, head2):
    tail = head1
    current1 = head1.next
    current2 = head2
    count = 0

    while current1 == None and current2 != None:
        if count%2 == 0:
            tail.next = current2
            current2 = current2.next
        else:
            tail.next = current1
            current1 = current1.next

        tail = tail.next
        count += 1

    if current1 != None:
        tail.next = current1

    if current2 != None:
        tail.next = current2

    return head1


def zipperListsRecursion(head1, head2):
    if head1 == None and head2 == None:
        return None

    if head1 == None:
        return head2

    if head2 == None:
        return head1

    next1 = head1.next
    next2 = head2.next
    head1.next = head2
    head2.next = zipperListsRecursion(next1, next2)
    return head1