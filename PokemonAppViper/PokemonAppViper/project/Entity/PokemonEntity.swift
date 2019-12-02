
//
//  PokemonEntity.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 02/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

struct PokemonEntity: Decodable {
    let id: Int
    let name: String
    let base_experience: Int
    let order: Int
    let types: [Types]
    let sprites: Sprites
}

struct Sprites: Decodable {
    let back_default: String
}
struct Types: Decodable {
    let type: Type
}

struct Type: Decodable {
    let name: String
}
