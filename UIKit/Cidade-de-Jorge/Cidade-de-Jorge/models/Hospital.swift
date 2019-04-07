//
//  Health.swift
//  Cidade-de-Jorge
//
//  Created by Lucas Cardoso on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import Foundation

class Hospital: Building {
    func Build(_ location: Location, _ building: Building?) -> Status {
        var status = Status(recursos: .neutral, populacao: .neutral, iniciativaPrivada: .neutral, arrecadacao: .neutral)
        
        if building == nil {
            status = Status(recursos: .majorDecrease, populacao: .majorImprove, iniciativaPrivada: .minorDecrease, arrecadacao: .minorDecrease)
        }
        
        
        return status
    }
    
    var name: String = "Hospital"
}
