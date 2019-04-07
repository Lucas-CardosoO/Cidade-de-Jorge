//
//  Building.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

protocol Building {
    func Build(_ location: Location, _ building: Building?) -> Status
    var name: String {get}
}

enum Location: Int {
    case central = 0
    case periferica
    case anywhere = 2
}

struct Status {
    var recursos: ValueChange
    var populacao: ValueChangePercent
    var iniciativaPrivada: ValueChangePercent
    var arrecadacao: ValueChange
}

enum ValueChange:Int {
    case majorImprove = 200
    case minorImprove = 100
    case neutral = 0
    case minorDecrease = -100
    case majorDecrease = -200
}

enum ValueChangePercent:Int {
    case majorImprove = 30
    case minorImprove = 15
    case neutral = 0
    case minorDecrease = -15
    case majorDecrease = -30
}

