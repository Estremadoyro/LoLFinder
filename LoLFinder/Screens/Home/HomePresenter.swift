//
//  HomePresenter.swift
//  LoLFinder
//
//  Created by Leonardo  on 28/09/22.
//

import UIKit

final class HomePresenter: NSObject, HomePresentable {
    private let interactor: HomeInteractive
    private let router: HomeRoutable
    
    // MARK: - Initializer
    required init(router: HomeRoutable, interactor: HomeInteractive) {
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter {
    func start() -> UIViewController {
        return router.start(with: self)
    }
}

// MARK: - HomePresentable
protocol HomePresentable: NSObject {
    func start() -> UIViewController
}
