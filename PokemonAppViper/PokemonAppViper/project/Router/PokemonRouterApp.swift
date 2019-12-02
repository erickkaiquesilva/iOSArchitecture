//
//  PokemonRouterApp.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 01/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

protocol PokemonRouterType {
    func viewResult(model: PokemonEntity)
}

class PokemonRouterApp: UINavigationController, PokemonRouterType {
    
    var currentViewController: UIViewController?
    
    func viewResult(model: PokemonEntity) {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "PokemonResultViewController") as? PokemonResultViewController {
            self.currentViewController = destinationVC
            self.pushViewController(destinationVC, animated: true)
            destinationVC.receivingData(model: model)
        }
    }
    
    func viewError() {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as? ErrorViewController {
            self.currentViewController = destinationVC
            self.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    func backView() {
        guard let viewController = currentViewController else { return }
        viewController.dismiss(animated: true, completion: nil)
    }
}
