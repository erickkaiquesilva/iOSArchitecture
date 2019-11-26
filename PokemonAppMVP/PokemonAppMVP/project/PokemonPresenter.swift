//
//  PokemonPresenter.swift
//  PokemonAppMVP
//
//  Created by Erick Kaique Da Silva on 26/11/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

enum Result<Data, Error> {
    case success(Data)
    case failure(Error)
}

protocol PokemonPresenterDelegate: class {
    var controller: PokemonViewControllerDelegate? { get set }
    func searchPokemon(name: String?)
}

class PresenterPokemon: PokemonPresenterDelegate {
    
    weak var controller: PokemonViewControllerDelegate?
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: URLSessionConfiguration.default)
    }
    
    func searchPokemon(name: String?) {
        
        guard let namePokemon = name, !namePokemon.isEmpty else {
            controller?.errorView(title: "O Campo esta Vázio", message: "Necessário preencher o campo para continuar")
            return
        }
        
        requestPokemon(name: namePokemon) { result in
            switch result {
            case .success(let data):
                let pokemonModel = try? JSONDecoder().decode(PokemonModel.self, from: data)
                guard let pokemon = pokemonModel else {
                    self.controller?.errorView(title: "Pokemon Não Existente", message: "OPS!!! O Pokemon solicitado não existe")
                    return
                }
                self.controller?.setupView(pokemonModel: pokemon)
            case .failure(let error):
                print(error)
            }
        }
    }
        
    func requestPokemon(name: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.sync {
                
                guard let data = data else {
                    completion(.failure(error!))
                    return
                }
                
                completion(.success(data))
            }
        }
        task.resume()
    }
}
