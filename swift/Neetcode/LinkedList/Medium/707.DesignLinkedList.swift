class Node {
    let val: Int
    var next: Node?

    init(_ val: Int, _ next: Node?) {
        self.val = val
        self.next = next
    }
}

class MyLinkedList {

    var head: Node?

    init() {
        self.head = nil
    }
    
    func get(_ index: Int) -> Int {
        var current = self.head
        
        for _ in 0..<index {
            current = current?.next
        }

        return current?.val ?? -1
    }
    
    func addAtHead(_ val: Int) {
        let new = Node(val, head)
        self.head = new
    }
    
    func addAtTail(_ val: Int) {
        let newNode = Node(val, nil)

        if head == nil {
            head = newNode
            return
        }

        var current = self.head

        while let next = current?.next {
            current = next
        }
        
        current?.next = newNode
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            let new = Node(val, self.head)
            self.head = new
        } else {
            var current = head

            for _ in 0..<index - 1 { 
                current = current?.next
            }

            if current == nil { return }
            
            let new = Node(val, current?.next)
            current?.next = new
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        if index == 0 {
            self.head = head?.next
        } else {
            var current = head

            for _ in 0..<index - 1 { 
                current = current?.next
            }

            if current == nil || current?.next == nil { return }
            
            current?.next = current?.next?.next
        }
    }
}