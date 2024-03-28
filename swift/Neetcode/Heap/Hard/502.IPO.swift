// You are given n projects where the ith project has a pure profit profits[i] 
// and a minimum capital of capital[i] is needed to start it.
// Initially, you have w capital. When you finish a project, you will obtain 
// its pure profit and the profit will be added to your total capital.
// Pick a list of at most k distinct projects from given projects to 
// maximize your final capital, and return the final maximized capital.

// Time: O(n * logn), Space: O(n)
func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
    let projects = zip(profits, capital).map { ($0.0, $0.1) }.sorted { $0.1 < $1.1 }
    var heap = Heap<Int>(.maxHeap)
    var result = w
    var k = k
    var i = 0

    while k > 0 {
        while i < projects.count, projects[i].1 <= result {
            heap.push(projects[i].0)
            i += 1
        }

        if let mostProfit = heap.pop() {
            result += mostProfit
            k -= 1
        } else {
            break
        }
    }   

    return result
}

print(findMaximizedCapital(2, 0, [1,2,3], [0,1,1]))
print(findMaximizedCapital(3, 0, [1,2,3], [0,1,2]))