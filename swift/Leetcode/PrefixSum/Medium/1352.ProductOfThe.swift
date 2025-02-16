// Design an algorithm that accepts a stream of integers and 
// retrieves the product of the last k integers of the stream.
// Implement the ProductOfNumbers class:
// ProductOfNumbers() Initializes the object with an empty stream.
// void add(int num) Appends the integer num to the stream.
// int getProduct(int k) Returns the product of the last k numbers 
// in the current list. You can assume that always the current list 
// has at least k numbers.

class ProductOfNumbers {
    var prefixProduct: [Int]
    var size: Int

    init() {
        prefixProduct = [1]
        size = 0
    }

    func add(_ num: Int) {
        if num == 0 {
            prefixProduct = [1]
            size = 0
        } else {
            prefixProduct.append(prefixProduct[size] * num)
            size += 1
        }
    }

    func getProduct(_ k: Int) -> Int {
        if k > size {
            return 0
        }
        return prefixProduct[size] / prefixProduct[size - k]
    }
}