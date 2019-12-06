//
//  PokemonNotification.swift
//  PokemonAppMVVM
//
//  Created by Erick Kaique Da Silva on 05/12/19.
//  Copyright © 2019 Erick Kaique Da Silva. All rights reserved.
//

import Foundation
import UIKit

class Bindable<T: Equatable> {
    
    typealias DidChangeHandler = (_ value: T?) -> Void
    
    private var changeHandler: DidChangeHandler?
    
    var value: T? {
        didSet {
            self.changeHandler?(value)
        }
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    func bind(handler: DidChangeHandler?) {
//        print("------- CHAMOU O BIND COM O VALOR NA CLASSE Bindable: \n \(value) \n \(handler) \n \(changeHandler)")
        self.changeHandler = handler
        handler?(value)
    }
}
