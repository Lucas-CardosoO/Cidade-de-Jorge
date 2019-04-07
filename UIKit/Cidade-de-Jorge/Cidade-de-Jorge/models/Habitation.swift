//
//  Habitation.swift
//  Cidade-de-Jorge
//
//  Created by Lucas Cardoso on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import Foundation

class Habitation: Building {
    func Build(_ location: Location, _ building: Building?) -> Status? {
        //        var status = Status(recursos: .neutral, populacao: .neutral, iniciativaPrivada: .neutral, arrecadacao: .neutral)
        var status: Status? = nil
        
        if(building == nil){
            switch location {
            case .central:
                status = Status(recursos: .minorDecrease, populacao: .majorImprove, iniciativaPrivada: .majorDecrease, arrecadacao: .neutral)
            default:
                status = Status(recursos: .minorDecrease, populacao: .minorImprove, iniciativaPrivada: .neutral, arrecadacao: .neutral)
            }
        }
        
        return status
    }
    
    var name: String = "Habitation"
    
    
}
