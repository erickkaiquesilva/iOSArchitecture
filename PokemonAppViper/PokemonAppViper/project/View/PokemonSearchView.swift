//
//  PokemonSearchView.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 01/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

protocol PokemonSearchViewType: UIView {
    var delegateController: PokemonSearchViewDelegate? { get set }
}

protocol PokemonSearchViewDelegate: class {
    func receiptNamePokemon(name: String?)
}

class PokemonSearchView: UIView, PokemonSearchViewType {
    
    weak var delegateController: PokemonSearchViewDelegate?
    
    @IBOutlet weak var inputPokemon: UITextField!
    
    @IBAction func btnSearchPokemon(_ sender: Any) {
        delegateController?.receiptNamePokemon(name: inputPokemon.text)
    }
}
