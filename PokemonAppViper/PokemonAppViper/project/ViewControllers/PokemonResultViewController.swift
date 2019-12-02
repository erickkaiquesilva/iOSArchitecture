//
//  PokemonResultViewController.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 02/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

class PokemonResultViewController: UIViewController {
    
    @IBOutlet weak var uiResultPokemon: PokemonResultView!
    
    private var model: PokemonEntity?
    
    let presenterOutputProtocol: PokemonOutputPresenterProtocol = PokemonOutputPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let modelPokemon = model else { return }
        uiResultPokemon.setupView(model: modelPokemon)
    }
    
    func receivingData(model: PokemonEntity) {
        self.model = model
    }
}
