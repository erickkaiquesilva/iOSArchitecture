//
//  ViewController.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 01/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, PokemonSearchViewDelegate {
    
    
    @IBOutlet weak var uiSearchView: PokemonSearchView!
    
    let pokemonInputPresenter = PokemonInputPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSearchView.delegateController = self
    }
    
    func receiptNamePokemon(name: String?) {
        pokemonInputPresenter.validatesPastData(name: name)
    }
    
}

