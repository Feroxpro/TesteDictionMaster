//
//  ViewController.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 05/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: HomeViewScreen?
    
    override func loadView() {
        screen = HomeViewScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

