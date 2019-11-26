//
//  ViewController.swift
//  PokemonAppMVP
//
//  Created by Erick Kaique Da Silva on 26/11/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

protocol PokemonViewControllerDelegate: class {
    func setupView(pokemonModel: PokemonModel)
    func errorView(title: String, message: String)
}

class PokemonViewController: UIViewController, PokemonViewControllerDelegate {
    
    @IBOutlet weak var textFielSearchPokemon: UITextField!
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var labelNamePokemon: UILabel!
    @IBOutlet weak var labelPowerPokemon: UILabel!
    @IBOutlet weak var labelTypePokemon: UILabel!
    
    var presenterDelegate: PokemonPresenterDelegate = PresenterPokemon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterDelegate.controller = self
    }
    
    func setupView(pokemonModel: PokemonModel) {
        imagePokemon.setImage(from: pokemonModel.sprites.back_default)
        labelNamePokemon.text = "Nome \(pokemonModel.name)"
        labelPowerPokemon.text = String("Poder \(pokemonModel.base_experience)")
        labelTypePokemon.text = String("Tipo \(pokemonModel.types[0].type.name)")
    }
    
    func errorView(title: String, message: String) {
        print("Error \(title) \(message)")
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
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

    @IBAction func btnSearchPokemon(_ sender: Any) {
        presenterDelegate.searchPokemon(name: textFielSearchPokemon.text)
    }
}

