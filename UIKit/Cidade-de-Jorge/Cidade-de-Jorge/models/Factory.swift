//
//  Factory.swift
//  Cidade-de-Jorge
//
//  Created by Lucas Cardoso on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import Foundation

class Factory: Building {
    func Build(_ location: Location, _ building: Building?) -> Status? {
//        var status = Status(recursos: .neutral, populacao: .neutral, iniciativaPrivada: .neutral, arrecadacao: .neutral)
        var status: Status? = nil
        
        if(building == nil){
            status = Status(recursos: .majorDecrease, populacao: .neutral, iniciativaPrivada: .majorImprove, arrecadacao: .majorImprove)
        } else if(building is Habitation){
            status = Status(recursos: .minorDecrease, populacao: .majorDecrease, iniciativaPrivada: .minorImprove, arrecadacao: .majorImprove)
        }
        
        return status
    }
    
    var name: String = "Factory"
    
}
