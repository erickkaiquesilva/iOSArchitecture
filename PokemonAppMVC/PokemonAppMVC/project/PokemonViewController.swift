//
//  ViewController.swift
//  PokemonAppMVC
//
//  Created by Erick Kaique Da Silva on 27/11/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, PokemonSearchViewDelegate {
    
    @IBOutlet weak var uiSearchView: PokemonSearchView!
    @IBOutlet weak var uiResultView: PokemonResultView!
    
    var networkDelegate: NetworkPokemonProtocol = NetworkPokemon()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiSearchView.delegateViewController = self
        networkDelegate.controller = self
    }
    
    func receiptNamePokemon(name: String?) {
        guard let namePokemon = name  else { return }
        networkDelegate.searchPokemon(name: namePokemon)
    }
}

extension PokemonViewController: PokemonNetworkDelegate {
    func updateModel(pokemonModel: PokemonModel) {
        uiResultView.updateView(pokemonModel: pokemonModel)
    }
    
    func errorModel(title: String, message: String) {
        let alert = uiResultView.errorView(title: title, message: message)
        self.present(alert, animated: true, completion: nil)
    }
}
