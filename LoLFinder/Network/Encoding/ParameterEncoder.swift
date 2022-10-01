//
//  ParameterEncoder.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation

protocol ParameterEncoder {
    /*
     Encode parameters, throws
     */
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

// MARK: - EncodingError
/*
 Messages for errors in encoding
 */
enum EncodingError: String, Error {
    case missingURL = "senku [Encoding] - Missing URL"
    case encodingFailed = "senku [Encoding] - Encoding failed"
}
