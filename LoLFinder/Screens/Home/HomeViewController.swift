//
//  HomeViewController.swift
//  LoLFinder
//
//  Created by Leonardo  on 28/09/22.
//

import UIKit

final class HomeViewController: UIViewController, HomeControllable {
    weak var presenter: HomePresentable?

    // MARK: - Initializers
    init(presenter: HomePresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - LifeCycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureUI()
    }
}

// MARK: - Configure Navigation
private extension HomeViewController {
    func configureNavigation() {
        let titleAttributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: .white]
        navigationItem.title = "LoL Finder"
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
}

// MARK: - Configure UI
private extension HomeViewController {
    func configureUI() {
        view.backgroundColor = .black
    }
}

// MARK: - HomeControllable
protocol HomeControllable {
    var presenter: HomePresentable? { get }
}
