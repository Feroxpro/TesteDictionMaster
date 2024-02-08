//
//  HomeViewModel.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 08/02/24.
//

import Foundation
import UIKit


class HomeViewModel {
    
    var homeViewController: HomeViewController?
    var homeScreen: HomeViewScreen?
    var selectedLanguage: String?

    
    init(homeViewController: HomeViewController, homeScreen: HomeViewScreen) {
        self.homeViewController = homeViewController
        self.homeScreen = homeScreen
    }
    
    func languageSelection() {
        homeScreen?.languageButton.addTarget(self, action: #selector(showLanguagePicker), for: .touchUpInside)
    }
    
    
    @objc func showLanguagePicker() {
        let alertController = UIAlertController(title: nil, message: "Select Language", preferredStyle: .actionSheet)
        
        ItemsMock.shared.loadItems { items in
            for item in items {
                let action = UIAlertAction(title: item.name, style: .default) { _ in
                    if let name = item.name {
                        self.homeScreen?.buttonTitle.text = name
                        self.homeScreen?.iconLanguage.image = UIImage(named: item.image)
                        self.selectedLanguage = name
                        self.performActionForSelectedLanguage()
                    }
                }
                alertController.addAction(action)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            self.homeViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func performActionForSelectedLanguage() {
        if let selectedLanguage = selectedLanguage {
            
            switch selectedLanguage {
            case "ENGLISH":
                homeScreen?.typeWordField.placeholder = "Type a word..."
                homeScreen?.searchButton.setTitle("SEARCH", for: .normal)
            case "FRANÇAIS":
                homeScreen?.typeWordField.placeholder = "tape un mot..."
                homeScreen?.searchButton.setTitle("RECHERCHE", for: .normal)
            case "ESPAÑOL":
                homeScreen?.typeWordField.placeholder = "escribe una palabra..."
                homeScreen?.searchButton.setTitle("BUSCAR", for: .normal)
            default: break
            }
        }
    }
}
