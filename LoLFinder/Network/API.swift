//
//  API.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation

struct API {
    var version: Version = .v1
    var environment: Server = .develop

    func getAPI() -> String {
        return "\(environment.getDomain)/api/\(version.getVersion)"
    }
}

enum Version: String {
    case v1 = "v1.1"
    case v2
    case v3

    var getVersion: String {
        return rawValue
    }
}

enum Server: String {
    case develop = "https://lol-friends-server.herokuapp.com"
    case production

    var getDomain: String {
        return rawValue
    }
}
