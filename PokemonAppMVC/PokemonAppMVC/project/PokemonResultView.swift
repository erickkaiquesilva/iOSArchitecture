//
//  PokemonResultView.swift
//  PokemonAppMVC
//
//  Created by Erick Kaique Da Silva on 29/11/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

protocol PokemonResultViewType: class {
    func updateView(pokemonModel: PokemonModel)
    func errorView(title: String, message: String) -> UIAlertController
}

class PokemonResultView: UIView, PokemonResultViewType {
    
    @IBOutlet weak var labelNamePokemon: UILabel!
    @IBOutlet weak var labelTypePokemon: UILabel!
    @IBOutlet weak var labelStrongPokemon: UILabel!
    @IBOutlet weak var labelOrderPokemon: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    
    func updateView(pokemonModel: PokemonModel) {
        constructView(pokemonModel: pokemonModel)
    }
    
    func errorView(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar Novamente", style: .cancel, handler: { action in
            switch action.style {
            case .default:
                print("Default")
            case .cancel:
                print("Cancel")
            case .destructive:
                print("Destructive")
            }
        }))
        return alert
    }
    
    private func constructView(pokemonModel: PokemonModel) {
        self.labelNamePokemon.text = pokemonModel.name
        self.labelTypePokemon.text = pokemonModel.types[0].type.name
        self.labelStrongPokemon.text = String(pokemonModel.base_experience)
        self.imagePokemon.setImage(from: pokemonModel.sprites.back_default)
    }
}
