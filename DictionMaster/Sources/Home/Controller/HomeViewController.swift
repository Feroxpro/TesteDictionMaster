//
//  ViewController.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 05/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeViewScreen?
    var viewModel: HomeViewModel?
    var coordinator: MainCoordinator?

    override func loadView() {
        homeScreen = HomeViewScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel() {
        if let homeScreen = homeScreen {
            if let coordinator = coordinator {
                viewModel = HomeViewModel(homeViewController: self, homeScreen: homeScreen, coordinator: coordinator)
                viewModel?.languageSelection()
                viewModel?.updateSearchButton()
                viewModel?.goSearchButton()
            }
        }
    }
}

