class Node:
    def __init__ (self, d, n = None):
        self.data = d
        self.next = n

def print_list(head):
    current = head
    while current:
        print(current.data, end=" ")
        current = current.next
    print()

def print_nth_from_end(head, n):
    length = 0
    current = head
    head = Node(0, head)

    
    while current:
        length += 1
        current = current.next
        
    if n > length:
        print("The value of n is greater than the length of the linked list.")
        return
    
    current = head
    for _ in range(length - n):
        current = current.next
    print(current.data)
        
head = Node(1)
head.next = Node(2)
head.next.next = Node(3)
head.next.next.next = Node(4)
head.next.next.next.next = Node(5)

print_nth_from_end(head, 0)
print_list(head)