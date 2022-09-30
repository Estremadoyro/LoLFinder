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
        return UINavigationController(nibName: nil, bundle: nil)
    }()
    
    // # MARK: Initializers
    init() {
        let router = HomeRouter(baseController: baseController)
        /// Interactor needs repository
        let interactor = HomeInteractor()
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
