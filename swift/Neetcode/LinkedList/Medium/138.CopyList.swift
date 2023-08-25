// A linked list of length n is given such that each node contains an additional 
// random pointer, which could point to any node in the list, or null.
// Construct a deep copy of the list.

func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }
    
    var map: [Node: Node] = [:]
    var current: Node? = head

    while let currentNode = current {
        if map[currentNode] == nil {
            map[currentNode] = Node(currentNode.val)
        }
        
        if let next = currentNode.next {
            if map[next] == nil {
                map[next] = Node(next.val)
            }
            if let mappedCurrent = map[currentNode], let mappedNext = map[next] {
                mappedCurrent.next = mappedNext
            }
        }
        
        if let random = currentNode.random {
            if map[random] == nil {
                map[random] = Node(random.val)
            }
            if let mappedCurrent = map[currentNode], let mappedRandom = map[random] {
                mappedCurrent.random = mappedRandom
            }
        }
        
        current = currentNode.next
    }
    
    return map[head]
}