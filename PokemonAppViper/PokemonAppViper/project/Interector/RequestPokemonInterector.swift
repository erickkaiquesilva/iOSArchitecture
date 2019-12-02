//
//  RequestPokemonInterector.swift
//  PokemonAppViper
//
//  Created by Erick Kaique Da Silva on 02/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

enum Result<Data, Error> {
    case success(Data)
    case failure(Error)
}

class RequestPokemonSearchInterector {
        
    var pokemonOutputPresenter: PokemonOutputPresenterProtocol
    
    var session: URLSession
    
    public init(pokemonOutputPresenter: PokemonOutputPresenterProtocol,
                configurantion: URLSessionConfiguration = URLSessionConfiguration.default) {
        self.session = URLSession(configuration: configurantion)
        self.pokemonOutputPresenter = pokemonOutputPresenter
    }
    
    func search(name: String) {
        
        requestPokemon(name: name) { result in
            switch result {
            case .success(let data):
                guard let dataPokemon = try? JSONDecoder().decode(PokemonEntity.self, from: data) else { return }
                self.pokemonOutputPresenter.show(model: dataPokemon)
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
