// Given an array of unique integers preorder, 
// return true if it is the correct preorder traversal sequence 
// of a binary search tree.

// Time: O(n), Space: O(1)
func verifyPreorder(_ preorder: [Int]) -> Bool {
    var preorder = preorder
    var currentMin = Int.min
    var i = 0

    for number in preorder {
        while i > 0, preorder[i - 1] < number {
            currentMin = preorder[i - 1]
            i -= 1
        }

        if number <= currentMin { return false }

        preorder[i] = number
        i += 1
    }

    return true
}

print(verifyPreorder([5,2,1,3,6]))
print(verifyPreorder([5,2,6,1,3]))


func verifyPreorder2(_ preorder: [Int]) -> Bool {
    var monotomic = [Int]()
    var currentMin = Int.min

    for number in preorder {
        while let last = monotomic.last, last < number {
            currentMin = monotomic.removeLast()
        }
        
        if number <= currentMin { return false }
        monotomic.append(number)
    }
    
    return true
}