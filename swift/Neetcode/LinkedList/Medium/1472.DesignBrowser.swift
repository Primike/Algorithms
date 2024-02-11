class Node {
    let value: String
    let previous: Node?
    var next: Node?

    init(_ value: String, _ previous: Node? = nil, _ next: Node? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

class BrowserHistory {

    var head: Node
    var current: Node

    init(_ homepage: String) {
        self.head = Node(homepage)
        self.current = self.head
    }
    
    func visit(_ url: String) {
        let new = Node(url, current, nil)
        current.next = new
        current = new
    }
    
    func back(_ steps: Int) -> String {
        var i = steps

        while i > 0, let previous = current.previous {
            current = previous
            i -= 1
        }

        return current.value
    }
    
    func forward(_ steps: Int) -> String {
        var i = steps

        while i > 0, let next = current.next {
            current = next
            i -= 1
        }

        return current.value 
    }
}