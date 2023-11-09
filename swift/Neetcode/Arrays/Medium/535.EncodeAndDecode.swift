class Codec {

    var encodeDict = [String: String]()
    var decodeDict = [String: String]()
    let tinyUrl = "http://tinyurl.com/"

    func encode(_ longUrl: String) -> String {
        if !encodeDict.keys.contains(longUrl) {
            var newUrl = tinyUrl + "\(encodeDict.keys.count + 1)"
            encodeDict[longUrl] = newUrl
            decodeDict[newUrl] = longUrl
        }

        return encodeDict[longUrl, default: ""]
    }
    
    func decode(_ shortUrl: String) -> String {
        return decodeDict[shortUrl, default: ""]
    }
}