//
//  PokemonOutputPresenter.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 02/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol PokemonOutputPresenterProtocol {
    func show(model: PokemonEntity)
    func errorView()
    func backErrorView()
}

class PokemonOutputPresenter: PokemonOutputPresenterProtocol {
    
    func show(model: PokemonEntity) {
        if let routerViewController = pokemonRouterApp {
            routerViewController.viewResult(model: model)
        }
    }
    
    func errorView() {
        if let routerViewController = pokemonRouterApp {
            routerViewController.viewError()
        }
    }
    
    func backErrorView() {
        if let routerViewController = pokemonRouterApp {
            routerViewController.backView()
        }
    }
}
