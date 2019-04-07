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
    init(populationRating:Int , empresarialRating:Int , recursos:Int , arrecadamento:Int){
        self.populationRating = populationRating
        self.empresarialRating = empresarialRating
        self.recursos = recursos
        self.arrecadamento = arrecadamento
    }
    // recebe a acao tomada e aplica isso a cidade
    func cityNextRound(acao:(AcoesTomadas,AcoesTomadas)){
    }
}
