class FindSumPairs {

    private var nums1: [Int]
    private var nums2: [Int]
    private var countMap: [Int: Int]

    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        self.countMap = nums2.reduce(into: [:]) { counts, num in
            counts[num, default: 0] += 1
        }
    }

    func add(_ index: Int, _ val: Int) {
        let oldValue = self.nums2[index]
        self.countMap[oldValue, default: 0] -= 1
        
        self.nums2[index] += val
        
        let newValue = self.nums2[index]
        self.countMap[newValue, default: 0] += 1
    }

    func count(_ tot: Int) -> Int {
        var ans = 0
        for num in self.nums1 {
            let rest = tot - num
            ans += self.countMap[rest, default: 0]
        }
        return ans
    }
}