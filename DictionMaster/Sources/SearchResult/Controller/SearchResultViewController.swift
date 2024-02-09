//
//  SearchResultViewController.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 08/02/24.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    var coordinator: Coordinator?
    var searchResultScreen: SearchResultScreenView?
    
    override func loadView() {
        searchResultScreen = SearchResultScreenView()
        view = searchResultScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
