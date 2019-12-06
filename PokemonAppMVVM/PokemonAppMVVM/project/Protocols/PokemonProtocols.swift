//
//  PokemonProtocols.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol PokemonSearchViewType {
    var delegateViewSearch: PokemonSearchViewDelegate? { get set }
}

protocol PokemonSearchViewDelegate: class {
    func receiveNamePokemon(name: String?)
}

protocol PokemonResultViewProtocol {
    func updateView(model: Pokemon?)
}

protocol PokemonViewModelProtocol {
    var pokemon: Bindable<Pokemon> { get }
    var error: Bindable<ErrorModel> { get }
    
    func validateData(name: String?)
}
