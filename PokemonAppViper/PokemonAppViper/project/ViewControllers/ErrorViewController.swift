//
//  ErrorViewController.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 02/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

class ErrorViewController: UIViewController {
    
    let presenterOutputProtocol: PokemonOutputPresenterProtocol = PokemonOutputPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnTryAgain(_ sender: Any) {
        presenterOutputProtocol.backErrorView()
    }
}
