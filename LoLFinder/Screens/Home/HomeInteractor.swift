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
    private let playerObservable = PublishSubject<PlayerEntity>()
    
    // MARK:  Presentable observables
    var currentPlayer: Driver<PlayerEntity> {
        return playerObservable.asDriver(onErrorJustReturn: PlayerEntity())
    }
    
    let dummyPlayer: Player = {
        var player = Player()
        player.name = "7speedcell7"
        player.level = 120
        return player
    }()
        
    // MARK:  Initializer
    init(playerRepository: PlayerRepositoryContract) {
        self.playerRepository = playerRepository
        let player = self.playerRepository.getPlayer(name: "7speedcell7", region: .lan)
        print("senku [DEBUG] \(String(describing: type(of: self))) - player: \(player)")
    }
}

// MARK: - HomeInteractive
protocol HomeInteractive {
    var currentPlayer: Driver<PlayerEntity> { get }
}
