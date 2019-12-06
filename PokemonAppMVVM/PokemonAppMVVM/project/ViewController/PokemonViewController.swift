//
//  ViewController.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, PokemonSearchViewDelegate {
    
    @IBOutlet weak var uiSearchView: PokemonSearchView!
    @IBOutlet weak var uiResultView: PokemonResultView!
    
    
    let pokemonViewModel: PokemonViewModelProtocol = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSearchView.delegateViewSearch = self
        setup()
    }

    func receiveNamePokemon(name: String?) {
        pokemonViewModel.validateData(name: name)
    }
    
    func setup() {
        updateViewController()
        updateError()
    }
    
    func updateViewController() {
        pokemonViewModel.pokemon.bind { pokemon in
//            print("--------- CHAMOU O BIND COM O VALOR NA FUNC updateViewController: \(pokemon)")
            self.uiResultView.updateView(model: pokemon)
        }
    }
    
    func updateError() {
        pokemonViewModel.error.bind { error in
//            print("--------- CHAMOU O BIND COM O VALOR NA FUNC updateError: \(error)")
            guard let errorModel = error else { return }
            self.errorView(model: errorModel)
        }
    }
    
    func errorView(model: ErrorModel) {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("Default")
            case .cancel:
                print("Cancel")
            case .destructive:
                print("Destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

