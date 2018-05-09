//
//  CommonApi.swift
//  App
//
//  Created by Adam Kaump on 5/7/18.
//

import Foundation

let apiKeyID = "3e8923b5f28a46c5e3cd3261dae3cfaa79dff89767ee0fe30d505e6f0e77ba2b"
let baseUrlString = "https://api.apple-cloudkit.com"
let querySubpath = "/database/1/iCloud.com.pinkshirtfriday.bestbet/development/public/records/query"
let modifySubpath = "/database/1/iCloud.com.pinkshirtfriday.bestbet/development/public/records/modify"
let userSubpath = "/database/1/iCloud.com.pinkshirtfriday.bestbet/development/public/users/discover"
let fetchSubpath = "/database/1/iCloud.com.pinkshirtfriday.bestbet/development/public/records/lookup"
let pemPath = "App.framework/Versions/A/Resources/eckey.pem"

class CommonAPI {
    
//    class func ckRequest(base: String, subpath: String, data: [String: AnyObject]) -> URLRequest {
//        let urlString = "\(base)\(subpath)"
//        let url = URL(string: urlString)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
////        let auth = PrivateKeyAuthenticator(apiKeyID: apiKeyID, pathToPEM: pemPath)
////        let bodyData = try! JSONSerialization.data(withJSONObject: data)
////        let additionalHeaders = auth.signedHeaders(for: bodyData, query: subpath)
////        for (name, value) in additionalHeaders {
////            request.addValue(value, forHTTPHeaderField: name)
////        }
////        request.httpBody = bodyData
//        return request
//    }

//    class func fetchUser(userId: String, completion: @escaping ([String: AnyObject]?) -> Void) {
////    class func fetchUser(bet: [String: AnyObject], completion: @escaping ([String: AnyObject]?) -> Void) {
//
//        print("fetching user: \(userId)")
//
//        let request = self.ckRequest(base: baseUrlString, subpath: fetchSubpath, data: self.userQueryDictionary(userId: userId))
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: request) { (data, response, error) in
//
//            guard data != nil, data!.toJson()!["records"] != nil else {
//                completion(nil)
//                return
//            }
//
//            let records = data!.toJson()!["records"] as! [[String: AnyObject]]
//            let user = records.first!
//            completion(user)
//            }.resume()
//    }
//
}

//extension CommonAPI {
//    class func userQueryDictionary(userId: String) -> [String: AnyObject] {
//        var dict = [String: AnyObject]()
//        dict["records"] = ["recordName": userId] as AnyObject
//        return dict
//    }
//
//    class func userBankUpdateDictionary(user: [String: AnyObject], newBank: Int) -> [String: AnyObject] {
//        let recordName = user["recordName"] as! String
//        let changeTag = user["recordChangeTag"] as! String
//
//        var dict = [String: AnyObject]()
//        dict["operations"] = ["operationType": "update", "record": ["recordName": recordName, "recordChangeTag": changeTag, "fields": ["bank": ["value": newBank]]]] as AnyObject
//        return dict
//    }
//}

//extension Dictionary where Key == String, Value == AnyObject {
//    func fieldValueFor(_ key: String) -> AnyObject {
//        let fields = self["fields"] as AnyObject
//        let keyDict = fields[key] as AnyObject
//        let value = keyDict["value"] as AnyObject
//        return value
//    }
//}

extension Data {
    func toJson() -> [String: Any]? {
        do {
            let dict = try JSONSerialization.jsonObject(with: self, options: []) as? [String :Any]
            return dict
        } catch {
            
        }
        
        return nil
    }
    
    var sha256: Data {
        var result = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        _ = result.withUnsafeMutableBytes { resultPtr in
            self.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) in
                CC_SHA256(bytes, CC_LONG(count), resultPtr)
            }
        }
        return result
    }
}
