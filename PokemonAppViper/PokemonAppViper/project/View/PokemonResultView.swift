//
//  PokemonResultView.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 01/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

protocol PokemonResultViewType {
    func setupView(model: PokemonEntity)
}
class PokemonResultView: UIView, PokemonResultViewType {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var labelNamePokemon: UILabel!
    @IBOutlet weak var labelStrongPokemon: UILabel!
    @IBOutlet weak var labelTypePokemon: UILabel!
    @IBOutlet weak var labelOrderPokemon: UILabel!
    
    func setupView(model: PokemonEntity) {
        imagePokemon.setImage(from: model.sprites.back_default)
        labelNamePokemon.text = model.name
        labelTypePokemon.text = model.types[0].type.name
        labelStrongPokemon.text = String(model.base_experience)
        labelOrderPokemon.text = String(model.order)
    }
}
