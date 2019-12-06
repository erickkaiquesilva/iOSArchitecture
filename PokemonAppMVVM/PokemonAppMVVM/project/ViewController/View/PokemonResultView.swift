//
//  PokemonResultView.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

class PokemonResultView: UIView, PokemonResultViewProtocol {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var labelNamePokemon: UILabel!
    @IBOutlet weak var labelStrongPokemon: UILabel!
    @IBOutlet weak var labelTypePokemon: UILabel!
    @IBOutlet weak var labelOrderPokemon: UILabel!
    
    func updateView(model: Pokemon?) {
        guard let modelPokemon = model else { return }
        setupView(model: modelPokemon)
    }
    
    private func setupView(model: Pokemon) {
        imagePokemon.setImage(from: model.image)
        labelNamePokemon.text = model.name
        labelStrongPokemon.text = model.strong
        labelTypePokemon.text = model.type
        labelOrderPokemon.text = model.order
    }
    
}
