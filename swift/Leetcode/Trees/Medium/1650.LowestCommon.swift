// Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).

// Time: O(n), Space: O(1)
func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
    guard let p = p, let q = q else { return nil }

    var pCount = 0
    var current = p

    while let parent = current.parent {
        current = parent
        pCount += 1
    }

    var qCount = 0
    current = q 

    while let parent = current.parent {
        current = parent
        qCount += 1
    }

    var pNode = p, qNode = q

    while pNode !== qNode {
        if pCount > qCount {
            pCount -= 1
            pNode = pNode.parent!
        } else if pCount < qCount {
            qCount -= 1
            qNode = qNode.parent!
        } else {
            pNode = pNode.parent!
            qNode = qNode.parent!
        }
    }

    return pNode
}