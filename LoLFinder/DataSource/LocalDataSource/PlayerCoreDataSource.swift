//
//  PlayerLocalDataSource.swift
//  LoLFinder
//
//  Created by Leonardo  on 30/09/22.
//

import Foundation
import CoreData

// MARK: - Local will be CoreData
final class PlayerCoreDataSource {
    // Container
    var coreDataContainer: PersistantContainer?
    // Context
    lazy var context: NSManagedObjectContext? = {
        coreDataContainer?.viewContext
    }()

    // Fetch request
    lazy var fetchRequest: NSFetchRequest<PlayerEntity> = {
        PlayerEntity.fetchRequest()
    }()
}

extension PlayerCoreDataSource: PlayerDataSourceContract {
    func getPlayer(name: String, region: Region) -> PlayerEntity {
        let predicate = NSPredicate(format: "name = %@", name)
        fetchRequest.predicate = predicate
        do {
            guard let playerEntity = try context?.fetch(fetchRequest).first else { return PlayerEntity() }
            print("senku [DEBUG] \(String(describing: type(of: self))) - found player: \(playerEntity.name ?? "")")

            return playerEntity
        } catch {
            print("senku [DEBUG] \(String(describing: type(of: self))) - error finding player")
            return PlayerEntity()
        }
    }

    func addFavoritePlayer(player: Player) {
        guard let context = context else { return }
        let newPlayer = PlayerEntity(context: context)
        newPlayer.name = player.name
        newPlayer.level = Int16(player.level)
        coreDataContainer?.save()
    }

    func getAllFavoritePlayers() -> [PlayerEntity] {
        do {
            if let players = try context?.fetch(fetchRequest) {
                print("senku [DEBUG] \(String(describing: type(of: self))) - players: \(players.map { $0.name ?? "" })")
                return players
            }
        } catch {
            print("senku [DEBUG] \(String(describing: type(of: self))) - error: \(error)")
        }
        return []
    }
}
