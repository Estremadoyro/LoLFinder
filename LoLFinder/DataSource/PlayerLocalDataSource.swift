//
//  PlayerLocalDataSource.swift
//  LoLFinder
//
//  Created by Leonardo  on 30/09/22.
//

import Foundation
import CoreData

// MARK: - Local will be CoreData
final class PlayerLocalDataSource {
    // MARK: CoreData
    var coreDataContainer: PersistantContainer?
    // Context
    private lazy var context: NSManagedObjectContext? = {
        return coreDataContainer?.viewContext
    }()
    
    // GET
    private lazy var fetchRequest: NSFetchRequest<Player> = {
        return Player.fetchRequest()
    }()
    
    init() {}
}

extension PlayerLocalDataSource: PlayerDataSourceContract {
    func getPlayer(name: String, region: Region) {
        do {
            let players = try context?.fetch(fetchRequest)
            print("senku [DEBUG] \(String(describing: type(of: self))) - players: \(players?.map {$0.name ?? ""})")
        } catch {
            print("senku [DEBUG] \(String(describing: type(of: self))) - error: \(error)")
        }
    }

    func addFavoritePlayer(player: Player) {
        guard let context = context else { return }
        print("senku [DEBUG] \(String(describing: type(of: self))) - contextttt: \(context)")
        var newPlayer = Player(context: context)
        newPlayer.name = "juanitio"
//        newPlayer.level = player.level
        
        do {
            try context.save()
        } catch {
            print("senku [DEBUG] \(String(describing: type(of: self))) - error saving \(error)")
//            getPlayer(name: "", region: .lan)
        }
    }
    
    func getAllFavoritePlayers() -> [Player] {
        return [Player]()
    }
}

// MARK: - PlayerDataSource
protocol PlayerDataSourceContract {
    func getPlayer(name: String, region: Region)
    func addFavoritePlayer(player: Player)
    func getAllFavoritePlayers() -> [Player]
}
