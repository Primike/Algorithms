class DLL {
    let url: String
    weak var previous: DLL?
    var next: DLL?

    init(_ url: String, _ previous: DLL?, _ next: DLL?) {
        self.url = url
        self.previous = previous
        self.next = next
    }
}

class BrowserHistory {

    var head: DLL
    var current: DLL

    init(_ homepage: String) {
        self.head = DLL(homepage, nil, nil)
        self.current = head
    }
    
    func visit(_ url: String) {
        let new = DLL(url, self.current, nil)
        self.current.next = new
        self.current = new
    }
    
    func back(_ steps: Int) -> String {
        var count = steps
        
        while count > 0, self.current !== self.head {
            self.current = self.current.previous!
            count -= 1
        }

        return self.current.url
    }
    
    func forward(_ steps: Int) -> String {
        var count = 0

        while count < steps, let next = self.current.next {
            self.current = next
            count += 1
        }

        return self.current.url
    }
}