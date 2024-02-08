//
//  Coordinator.swift
//  MultitechOS
//
//  Created by Felipe Domingos on 12/04/23.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController  { get set }
    
    func start()
}
