//
//  Shopping.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import Foundation

class Shopping: Building {
    func Build(_ location: Location, _ building: Building?) -> Status {
        var status = Status(recursos: .neutral, populacao: .neutral, iniciativaPrivada: .neutral, arrecadacao: .neutral)
        
        if(building == nil){
            status = Status(recursos: .minorDecrease, populacao: .minorImprove, iniciativaPrivada: .majorImprove, arrecadacao: .minorImprove)
        } else {
            status = Status(recursos: .neutral, populacao: .majorDecrease, iniciativaPrivada: .majorImprove, arrecadacao: .minorImprove)
        }
        
        return status
    }
    
    var name: String = "Shopping"
}
