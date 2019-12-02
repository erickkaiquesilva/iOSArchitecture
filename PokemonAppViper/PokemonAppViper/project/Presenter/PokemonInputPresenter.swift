//
//  PokemonInputPresenter.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 02/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol PokemonInputPresenterProtocol: class {
    func validatesPastData(name: String?)
}

class PokemonInputPresenter: PokemonInputPresenterProtocol {
    
    var pokemonOutputPresenter: PokemonOutputPresenterProtocol
    
    init() {
        self.pokemonOutputPresenter = PokemonOutputPresenter()
    }
    
    func validatesPastData(name: String?) {
        guard let namePokemon = name, !namePokemon.isEmpty else {
            pokemonOutputPresenter.errorView()
            return
        }
        searchPokemon(name: namePokemon)
    }
    
    func searchPokemon(name: String) {
        RequestPokemonSearchInterector(pokemonOutputPresenter: pokemonOutputPresenter).search(name: name)
    }
}
