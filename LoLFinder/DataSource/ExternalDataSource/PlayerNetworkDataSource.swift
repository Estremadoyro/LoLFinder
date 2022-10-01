//
//  NetworkDataSource.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation

final class PlayerNetworkDataSource {
    var networkContainer: Any?
}

extension PlayerNetworkDataSource: PlayerDataSourceContract {
    func getPlayer(name: String, region: Region) -> PlayerEntity {
        return PlayerEntity()
    }

    func addFavoritePlayer(player: Player) {}

    func getAllFavoritePlayers() -> [PlayerEntity] {
        return [PlayerEntity]()
    }
}
