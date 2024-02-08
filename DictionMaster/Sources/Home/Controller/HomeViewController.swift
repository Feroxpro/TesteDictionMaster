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
            viewModel = HomeViewModel(homeViewController: self, homeScreen: homeScreen)
            viewModel?.languageSelection()
        }
    }
}

