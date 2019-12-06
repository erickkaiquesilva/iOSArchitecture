//
//  PokemonModel.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

struct PokemonModel: Decodable {
    let id: Int
    let name: String
    let base_experience: Int
    let order: Int
    let types: [Types]
    let sprites: Sprites
}

struct Sprites: Decodable {
    let back_default: String
    let front_default: String
    let front_shiny: String
    let front_female: String
}
struct Types: Decodable {
    let type: Type
}

struct Type: Decodable {
    let name: String
}
