// You are given an array arr of positive integers. 
// You are also given the array queries where queries[i] = [lefti, righti].
// For each query i compute the XOR of elements from lefti to righti 
// (that is, arr[lefti] XOR arr[lefti + 1] XOR ... XOR arr[righti] ).
// Return an array answer where answer[i] is the answer to the ith query.

func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
    var prefixXor = [Int](repeating: 0, count: arr.count + 1)

    for i in 0..<arr.count {
        prefixXor[i + 1] = prefixXor[i] ^ arr[i]
    }

    var result = [Int]()
    
    for query in queries {
        let l = query[0], r = query[1]
        result.append(prefixXor[r + 1] ^ prefixXor[l])
    }

    return result
}

print(xorQueries([1,3,4,8], [[0,1],[1,2],[0,3],[3,3]]))
print(xorQueries([4,8,2,10], [[2,3],[1,3],[0,0],[0,3]]))