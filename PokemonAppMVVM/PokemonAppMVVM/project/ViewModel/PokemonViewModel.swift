//
//  PokemonViewModel.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class PokemonViewModel: PokemonViewModelProtocol {
    
    var error = Bindable<ErrorModel>()
    
    let pokemon = Bindable<Pokemon>()
    
    var session: URLSession
    
    public init(configurantion: URLSessionConfiguration = URLSessionConfiguration.default) {
        self.session = URLSession(configuration: configurantion)
    }
    
    func validateData(name: String?) {
        guard let namePokemon = name, !namePokemon.isEmpty else {
            setupError(model: ErrorModel(title: "Campo Vázio", message: "Preencha o campo para poder obter o resultado de uma pesquisa"))
            return
        }
        requestPokemon(name: namePokemon.lowercased()) { result in
            switch result {
            case .success(let data):
                guard let modelPokemon = try? JSONDecoder().decode(PokemonModel.self, from: data) else {
                    self.setupError(model: ErrorModel(title: "Pokemon Inválido", message: "Coloque o nome de um pokemon válido!!!"))
                    return }
                self.setupPokemon(model: modelPokemon)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setupPokemon(model: PokemonModel) {
        pokemon.value = Pokemon(image: model.sprites.front_default,
                              name: model.name,
                              strong: String(model.base_experience),
                              order: String(model.order),
                              type: model.types[0].type.name)
    }
    
    func setupError(model: ErrorModel) {
        error.value = model
    }
    
    private func requestPokemon(name: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
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
