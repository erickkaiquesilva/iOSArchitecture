//
//  PokemonSearchView.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

class PokemonSearchView: UIView, PokemonSearchViewType {
    
    weak var delegateViewSearch: PokemonSearchViewDelegate?
    
    
    @IBOutlet weak var inputNameSearch: UITextField!
    
    @IBAction func btnSearchPokemon(_ sender: Any) {
        delegateViewSearch?.receiveNamePokemon(name: inputNameSearch.text)
    }
}
