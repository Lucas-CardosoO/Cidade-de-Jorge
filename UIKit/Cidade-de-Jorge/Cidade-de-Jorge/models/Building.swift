//
//  Building.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

protocol Building {
    func Build(_ location: Location) -> Status
    var name: String {get}
}

enum Location: Int {
    case central = 0
    case periferica
}

struct Status {
    var recursos: Int
    var populacao: Int
    var iniciativaPrivada: Int
    var arrecadacao: Int
}

