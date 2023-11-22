// Design an algorithm to encode a list of strings to a string. 
// The encoded string is then sent over the network and is decoded 
// back to the original list of strings.


class Codec {
    func encode(_ strs: [String]) -> String {
        var encoded = ""

        for str in strs {
            encoded += "\(str.count)#\(str)"
        }

        return encoded
    }

    func decode(_ s: String) -> [String] {
        let sArray = Array(s)
        var decoded = [String]()
        var i = 0

        while i < sArray.count {
            var j = i

            while sArray[j] != "#" {
                j += 1
            }

            let length = Int(String(sArray[i..<j]))!
            decoded.append(String(sArray[j + 1..<j + 1 + length]))
            
            i = j + 1 + length
        }

        return decoded
    }
}
