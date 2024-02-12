// Design a class to find the kth largest element in a stream. 
// Note that it is the kth largest element in the sorted order, 
// not the kth distinct element.

//Time: O(nlogk), Space: O(k)
class KthLargest {

    var heap: Heap<Int>
    let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.heap = Heap(.minHeap)
        self.k = k

        for number in nums {
            add(number)
        }
    }
    
    func add(_ val: Int) -> Int {
        if heap.count == k, let first = heap.peek() {
            if first > val { return first }
            heap.pop()
        } 

        heap.push(val)
        return heap.peek() ?? 0
    }
}