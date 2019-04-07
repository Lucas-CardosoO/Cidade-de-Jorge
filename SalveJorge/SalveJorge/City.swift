//
//  City.swift
//  SalveJorge
//
//  Created by Kacio on 4/7/19.
//  Copyright © 2019 Kacio. All rights reserved.
//
import Foundation
//aqui vai a cidade em geral
//tendo sempre aqueles recursos que defenimos
class City:NSObject{
    var populationRating:Int
    var empresarialRating:Int
    var recursos:Int
    var arrecadamento:Int
    var delegate:CityComunication?
    init(populationRating:Int , empresarialRating:Int , recursos:Int , arrecadamento:Int){
        self.populationRating = populationRating
        self.empresarialRating = empresarialRating
        self.recursos = recursos
        self.arrecadamento = arrecadamento
    }
    // recebe a acao tomada e aplica isso a cidade
    func cityNextRound(acao:(AcoesTomadas,AcoesTomadas)){
        
        self.delegate?.dead()
    }
    func cityEfect(action:AcoesTomadas){
        switch action {
        case .parque :
            self.arrecadamento -= 100
            self.recursos -= 200
            self.empresarialRating -= 15
            self.populationRating += 30
            break
        case .hospital:
            self.arrecadamento -= 100
            self.recursos -= 200
            self.populationRating += 30
            self.empresarialRating -= 15
            break
        case .escolaPublicaPeriferia:
            self.arrecadamento -= 100
            self.recursos -= 100
            self.populationRating += 15
            break
        case .escolaPublicaAreaCentral:
            self.arrecadamento -= 100
            self.recursos -= 200
            self.populationRating += 30
            self.empresarialRating -= 15
            break
        case .financiarHabitacaoAreaNobre:
            self.recursos -= 100
            self.populationRating += 30
            self.empresarialRating -= 30
            break
        case .financiarHabitacaoPerifeiria:
            self.recursos -= 100
            self.populationRating += 15
            break
        case .fabricaAreaLivre:
            self.recursos -= 200
            self.arrecadamento += 200
            self.empresarialRating += 30
            break
        case .fabricaAreaOcupada:
            self.recursos -= 100
            self.arrecadamento += 200
            self.populationRating -= 30
            self.empresarialRating += 15
            break
        case .arranhaCeuDeLuxoNobre:
            self.recursos += 100
            self.arrecadamento += 200
            self.populationRating -= 15
            self.empresarialRating += 30
            break
        case .arranhaCeuDeLuxoAreaPreriferia:
            self.arrecadamento += 100
            self.populationRating -= 15
            self.empresarialRating += 15
            break
        case .shoppingAreaLivre:
            self.arrecadamento += 100
            self.recursos -= 200
            self.populationRating += 15
            self.empresarialRating += 30
            break
        case .shopingAreaOcupada:
            self.arrecadamento += 100
            self.populationRating -= 30
            self.empresarialRating += 30
            break
        default:
            self.populationRating -= 15
            break
        }
    }
}
