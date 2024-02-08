//
//  Register.swift
//  CadastroUnico
//
//  Created by Felipe Domingos on 22/09/22.
//

import Foundation
import UIKit

struct Item {
    
    var name: String?
    var image: String
}

class ItemsMock {
    static let shared = ItemsMock()
    
    func loadItems(completion: @escaping ([Item]) -> Void) {
        let items = [
            Item(name: "ENGLISH",  image: "English"),
            Item(name: "FRANÇAIS",  image: "Français"),
            Item(name: "ESPAÑOL",    image: "Español"),

        ]
        completion(items)
    }
}

