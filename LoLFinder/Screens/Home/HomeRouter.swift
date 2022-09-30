//
//  HomeRouter.swift
//  LoLFinder
//
//  Created by Leonardo  on 28/09/22.
//

import UIKit

final class HomeRouter: HomeRoutable {
    private var navigationController: UINavigationController
    
    required init(baseController: UINavigationController) {
        self.navigationController = baseController
    }
}

extension HomeRouter {
    func start(with presenter: HomePresentable) -> UINavigationController {
        let viewController = HomeViewController(presenter: presenter)
        navigationController.setViewControllers([viewController], animated: false)
        return navigationController
    }
}

// MARK: - HomeRoutable
protocol HomeRoutable {
    func start(with presenter: HomePresentable) -> UINavigationController
}
