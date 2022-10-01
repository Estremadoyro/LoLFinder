//
//  JSONParameterParser.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation

enum URLParameterEncoder: ParameterEncoder {
    // MARK: Format & attach the dic. as query parameters for the urlRequest
    /*
     Encode parameters into the request's url
     */
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw EncodingError.missingURL }
        /// Create a URLComponents obj. from the url
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            /// Reset the query items
            urlComponents.queryItems = [URLQueryItem]()
            parameters.forEach { key, value in
                /// Format parameter's value to String & encode the percentage encoding (%20 = space)
                let value: String? = (value as? String)?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                /// Append data to query items
                urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
            }

            /// Update urlRequest's url with the new url
            urlRequest.url = urlComponents.url
        }

        /// Specify the Content-Type header in case it's not configured
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            /// For query parameters the header value should be "application/x-www-form-urlencoded; charset=utf-8"
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
