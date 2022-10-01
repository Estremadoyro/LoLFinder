//
//  RepositoryContract.swift
//  LoLFinder
//
//  Created by Leonardo  on 30/09/22.
//

import Foundation

// TODO: Add observables to the responses
final class PlayerRepository {
    // Data sources
    // CoreData, network, etc
    private let playerLocalDataSource: PlayerDataSourceContract
    
    init(playerLocalDataSource: PlayerDataSourceContract) {
        self.playerLocalDataSource = playerLocalDataSource
    }
}

// MARK: - RepositoryMethods
extension PlayerRepository: PlayerRepositoryContract {
    func getPlayer(name: String, region: Region) {
        playerLocalDataSource.getPlayer(name: name, region: region)
        print("senku [DEBUG] \(String(describing: type(of: self))) - getPlayer()")
    }

    func addFavoritePlayer(player: Player) {
        playerLocalDataSource.addFavoritePlayer(player: player)
    }
    func getAllFavoritePlayers() -> [Player] {
        return [Player]()
    }
}

// MARK: - RepositoryContract
protocol PlayerRepositoryContract {
    func getPlayer(name: String, region: Region)
    func addFavoritePlayer(player: Player)
    func getAllFavoritePlayers() -> [Player]
}

