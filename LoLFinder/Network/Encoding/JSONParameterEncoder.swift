//
//  JSONParameterEncoder.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation

enum JSONParameterEncoder: ParameterEncoder {
    // MARK: Encodes the parameters (data) into JSON readable to send as body payload
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let dictAsJSON = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = dictAsJSON

            /// Specify the Content-Type header in case it's not configured
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                /// For body the header value should be "application/json"
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            print("senku [DEBUG] \(String(describing: type(of: self))) - JSON Encoding failed: \(error)")
            throw EncodingError.encodingFailed
        }
    }
}
