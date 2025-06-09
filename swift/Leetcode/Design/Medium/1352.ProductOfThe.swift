// Design an algorithm that accepts a stream of integers and 
// retrieves the product of the last k integers of the stream.
// Implement the ProductOfNumbers class:
// ProductOfNumbers() Initializes the object with an empty stream.
// void add(int num) Appends the integer num to the stream.
// int getProduct(int k) Returns the product of the last k numbers 
// in the current list. You can assume that always the current list 
// has at least k numbers.

class ProductOfNumbers {

    private var stream: [Int]

    init() {
        stream = [1]
    }

    func add(_ num: Int) {
        if num == 0 {
            stream = [1]
        } else {
            stream.append(stream.last! * num)
        }
    }

    func getProduct(_ k: Int) -> Int {
        if k >= stream.count { return 0 }
        return stream.last! / stream[stream.count - 1 - k]
    }
}