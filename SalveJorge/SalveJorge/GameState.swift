//
//  GameController .swift
//  SalveJorge
//
//  Created by Kacio on 4/7/19.
//  Copyright © 2019 Kacio. All rights reserved.
//

import Foundation

enum AcoesTomadas{
    case parque , hospital, escolaPublicaPeriferia,financiarHabitacaoAreaNobre, escolaPublicaAreaCentral, financiarHabitacaoPerifeiria ,fabricaAreaLivre,fabricaAreaOcupada,shoppingAreaLivre,shopingAreaOcupada,arranhaCeuDeLuxoNobre,arranhaCeuDeLuxoAreaPreriferia,Nada
}
protocol CityComunication{
    func dead()
}
class GameRun:NSObject ,CityComunication{
    var count:Int
    var city:City
    var acaoTomada:(AcoesTomadas,AcoesTomadas)?
    init(city:City) {
       self.city = city
       self.count = 0
    }
    func nextRound(){
        guard let acao = self.acaoTomada else {
            print("erro sem acao")
            return
        }
        city.cityNextRound(acao:acao)
        self.count += 1
    }
    func addAcao(acaoFimDaRoda:(AcoesTomadas,AcoesTomadas)){
        self.acaoTomada = acaoFimDaRoda
        //mando passar de acao aqui
        self.nextRound()
    }
    func dead() {
    }
    
}
