//
//  NetworkPokemon.swift
//  PokemonAppMVC
//
//  Created by Erick Kaique Da Silva on 29/11/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

enum Result<Data, Error> {
    case success(Data)
    case failure(Error)
}

protocol NetworkPokemonProtocol: class {
    var controller: PokemonNetworkDelegate? { get set }
    func searchPokemon(name: String)
}

protocol PokemonNetworkDelegate: class {
    func updateModel(pokemonModel: PokemonModel)
    func errorModel(title: String, message: String)
}

class NetworkPokemon: NetworkPokemonProtocol {
    
    weak var controller: PokemonNetworkDelegate?
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: URLSessionConfiguration.default)
    }
    
    func searchPokemon(name: String) {
        requestPokemon(name: name) { result in
            switch result {
            case .success(let data):
                let pokemonModel = try? JSONDecoder().decode(PokemonModel.self, from: data)
                guard let pokemon = pokemonModel else {
                    self.controller?.errorModel(title: "Pokemon Não Existente", message: "OPS!!! O Pokemon solicitado não existe")
                    return
                }
                self.controller?.updateModel(pokemonModel: pokemon)
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
