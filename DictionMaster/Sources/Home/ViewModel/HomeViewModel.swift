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
    var resultLanguage: String = "en"
    var coordinator: MainCoordinator?
    var searchResultViewModel: SearchResultViewModel?
    var restManager = RestManager()
    
    
    init(homeViewController: HomeViewController, homeScreen: HomeViewScreen, coordinator: MainCoordinator) {
        self.homeViewController = homeViewController
        self.homeScreen = homeScreen
        self.coordinator = coordinator
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
    
    func updateSearchButton() {
        homeScreen?.typeWordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, text.count > 1 {
            homeScreen?.searchButton.isHidden = false
        } else {
            homeScreen?.searchButton.isHidden = true
        }
    }
    
    func goSearchButton() {
        homeScreen?.searchButton.addTarget(self, action: #selector(showResultSearchWord), for: .touchUpInside)
    }
    
    @objc func showResultSearchWord() {
        callSearchResult()
        coordinator?.goToSearchResult()
    }
    
    func callSearchResult() {
        if let selectedLanguage = selectedLanguage {
            
            switch selectedLanguage {
            case "ENGLISH":
                resultLanguage = "en"
            case "FRANÇAIS":
                resultLanguage = "fr"
            case "ESPAÑOL":
                resultLanguage = "es"
            default: break
            }
        }
        
        if let inseterdWord = homeScreen?.typeWordField.text {
            restManager.fetchWordData(lang: resultLanguage, word: inseterdWord) { result in
                print(result)
            }
        }
    }
}
