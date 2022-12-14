//
//  HomeModule.swift
//  LoLFinder
//
//  Created by Leonardo  on 28/09/22.
//

import UIKit

final class HomeModule: ScreenModule {
    // # MARK: Properties
    // Presenter
    private let presenter: HomePresentable
    private var baseController: UINavigationController = {
        UINavigationController(nibName: nil, bundle: nil)
    }()

    // # MARK: Initializers
    init() {

        // Data sources
        let playerCoreDataSource = PlayerCoreDataSource()
        playerCoreDataSource.coreDataContainer = CoreDataManager.shared.container
        // Repositories
        let playerRepository = PlayerRepository(playerLocalDataSource: playerCoreDataSource)
        
        // VIPER
        let interactor = HomeInteractor(playerRepository: playerRepository)
        let router = HomeRouter(baseController: baseController)
        let presenter = HomePresenter(router: router, interactor: interactor)
        self.presenter = presenter
    }
}

extension HomeModule {
    func start() -> UIViewController {
        return presenter.start()
    }
}

// MARK: - HomeModuleProtocol
protocol ScreenModule {
    func start() -> UIViewController
}
