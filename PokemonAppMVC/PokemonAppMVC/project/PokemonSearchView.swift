//
//  PokemonSearchView.swift
//  PokemonAppMVC
//
//  Created by Erick Kaique Da Silva on 27/11/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import UIKit


protocol PokemonSearchViewType: UIView {
    var delegateViewController: PokemonSearchViewDelegate? { get set }
}

protocol PokemonSearchViewDelegate: class {
    func receiptNamePokemon(name: String?)
}


class PokemonSearchView: UIView, PokemonSearchViewType {
    
    weak var delegateViewController: PokemonSearchViewDelegate?
    
    @IBOutlet weak var inputNamePokemon: UITextField!
    
    var viewDelegate: PokemonSearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func btnSearchPokemon(_ sender: Any) {
        delegateViewController?.receiptNamePokemon(name: inputNamePokemon.text)
    }
    
}
