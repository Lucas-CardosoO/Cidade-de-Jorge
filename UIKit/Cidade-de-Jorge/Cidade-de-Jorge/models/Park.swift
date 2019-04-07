//
//  Park.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import Foundation

class Park: Building {
    func Build(_ location: Location, _ building: Building?) -> Status? {
        if building != nil{
//            return Status(recursos: .neutral, populacao: .neutral, iniciativaPrivada: .neutral, arrecadacao: .neutral)
            return nil
        }else{
            return Status(recursos: .majorDecrease, populacao: .majorImprove, iniciativaPrivada: .minorDecrease, arrecadacao: .minorDecrease)
        }
    }
    
    var name: String = "Parque"
}
