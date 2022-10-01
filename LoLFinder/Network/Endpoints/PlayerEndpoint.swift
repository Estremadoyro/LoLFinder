//
//  PlayerEndpoint.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation

enum PlayerEndpoint {
    case findPlayer(summonerName: String, region: Region)
}

extension PlayerEndpoint: Endpoint {
    var type: RequestType {
        switch self {
            case .findPlayer:
                return .get
        }
    }

    var params: Parameters {
        switch self {
            case .findPlayer(let summonerName, let region):
                return ["summonerName": summonerName, "region": region.rawValue]
        }
    }

    var headers: Headers? { return nil }

    var path: String {
        let api = API()
        return "\(api.getAPI())/summoner"
    }
}

// MARK: RequestType
/*
 GET, PUT, DELETE, POST
 */
enum RequestType: String {
    case get = "GET"
}

// MARK: - Endpoint
protocol Endpoint {
    var type: RequestType { get }
    var params: Parameters { get }
    var headers: Headers? { get }
    var path: String { get }
}

typealias Parameters = [String: Any]
typealias Headers = [String: Any]
