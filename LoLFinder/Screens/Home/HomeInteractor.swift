//
//  HomeInteractor.swift
//  LoLFinder
//
//  Created by Leonardo  on 28/09/22.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeInteractor: HomeInteractive {
    // MARK:  Properties
    // Repositories
    private var playerRepository: PlayerRepositoryContract
    // Observables
    private let playerObservable = PublishSubject<Player>()
    
    // MARK:  Presentable observables
    var currentPlayer: Driver<Player> {
        return playerObservable.asDriver(onErrorJustReturn: Player())
    }
    
    let dummyPlayer: Player = {
        let player = Player()
        //        player.name = "7speedcell7"
//        player.level = 120
        return player
    }()
        
    // MARK:  Initializer
    init(playerRepository: PlayerRepositoryContract) {
        self.playerRepository = playerRepository
//        self.playerRepository.addFavoritePlayer(player: dummyPlayer)
        self.playerRepository.getPlayer(name: "", region: .lan)
    }
}

// MARK: - HomeInteractive
protocol HomeInteractive {
    var currentPlayer: Driver<Player> { get }
}
