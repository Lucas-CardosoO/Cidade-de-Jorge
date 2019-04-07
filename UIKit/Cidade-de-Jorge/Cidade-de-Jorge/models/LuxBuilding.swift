//
//  luxBuilding.swift
//  Cidade-de-Jorge
//
//  Created by Lucas Cardoso on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import Foundation

class LuxBuilding: Building {
    func Build(_ location: Location) -> Status {
        var status = Status(recursos: .neutral, populacao: .neutral, iniciativaPrivada: .neutral, arrecadacao: .neutral)
        switch location {
        case .central:
            status = Status(recursos: .minorImprove, populacao: .minorDecrease, iniciativaPrivada: .majorImprove, arrecadacao: .majorImprove)
        default:
            status = Status(recursos: .neutral, populacao: .minorDecrease, iniciativaPrivada: .minorImprove, arrecadacao: .minorImprove)
        }
        return status
    }
    
    var name: String = "Predio de Luxo"
}
