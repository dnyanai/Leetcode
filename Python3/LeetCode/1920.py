## Convert to a decimal number from a sequence of binary digits

class Node:
    def __init__(self,val):
        self.val =  val,
        self.next = None

class B2D:
    def __init__(self):
        self.head = None

    def Getb2d(self):
        num = self.head.val

        while self.head.next is not None:
            print(type(num))
            num = int(num * 2 + self.head.next.val)
            self.head = self.head.next
        return num

    def add(self,val):
        if self.head is None:
            self.head = Node(val)
        else:
            current = self.head
            while current.next is not None:
                current = current.next
            current.next = Node(val)

if __name__ == "__main__":
    a = B2D()
    a.add(0)
    a.add(0)
    a.add(1)
    a.add(0)

    num = a.Getb2d()

    print(num)