class Node:

    def __init__(self, data):
        self.data = data
        self.next = None


class LinkedList:

    def __init__(self):
        self.head = None

    def add(self, val):
        if self.head is None:
            self.head = Node(val)
        else:
            current = self.head
            while current.next is not None:
                current = current.next
            current.next = Node(val)

    def insert(self, val, pos):
        index = 0
        prev = None
        current = self.head

        while index < pos and current is not None:
            prev = current
            current = current.next
            index += 1

        # will come out when index is no longer less than pos and current is None
        temp = current
        new_node = Node(val)
        new_node.next = temp

        if prev is None:
            self.head = new_node
        else:
            prev.next = new_node

    def display(self):
        current = self.head
        while current is not None:
            print(current.data, end=" ")
            current = current.next

    def remove(self, val):
        # if list is empty
        if self.head is None:
            return

        # if we want to remove the first node of LL
        if self.head.data == val:
            self.head = self.head.next

        else:
            current = self.head
            while current is not None and current.data != val:
                prev = current
                current = current.next

            if current is not None:
                prev.next = current.next
            else:
                print("Requested node to delete not in the Linked List")


if __name__ == "__main__":
    # print(a.data)
    a2 = LinkedList()
    a2.add(3)
    a2.add(4)
    a2.add(5)
    print("LL after adding nodes:")
    a2.display()

    a2.insert(-12, 4)
    print("\n LL after inserting a node:")
    a2.display()

    print("\n LL after removing a node:")
    a2.remove(-12)
    a2.display()
