//
//  MainCoordinator.swift
//  MultitechOS
//
//  Created by Felipe Domingos on 08/04/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator] ()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
        }
    
    func goToSearchResult() {
        let viewController = SearchResultViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
        }
    }
