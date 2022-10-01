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
    func getPlayer(name: String, region: Region) -> PlayerEntity {
        print("senku [DEBUG] \(String(describing: type(of: self))) - getPlayer()")
        return playerLocalDataSource.getPlayer(name: name, region: region)
    }

    func addFavoritePlayer(player: Player) {
        playerLocalDataSource.addFavoritePlayer(player: player)
    }

    func getAllFavoritePlayers() -> [PlayerEntity] {
        let players = playerLocalDataSource.getAllFavoritePlayers()
        print("senku [DEBUG] \(String(describing: type(of: self))) - getAllFavoritePlayers()")
        print("senku [DEBUG] \(String(describing: type(of: self))) - \(players.map { $0.name ?? "" })")
        return players
    }
}

// MARK: - RepositoryContract
protocol PlayerRepositoryContract {
    func getPlayer(name: String, region: Region) -> PlayerEntity
    func addFavoritePlayer(player: Player)
    func getAllFavoritePlayers() -> [PlayerEntity]
}

// MARK: - PlayerDataSource
protocol PlayerDataSourceContract {
    func getPlayer(name: String, region: Region) -> PlayerEntity
    func addFavoritePlayer(player: Player)
    func getAllFavoritePlayers() -> [PlayerEntity]
}
