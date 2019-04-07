//
//  ViewController.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import UIKit

typealias BuildingMap = (building: Building, location: Location, destination: Building?)
typealias MapCell = (id: Int, type: Location, building: Building?)

class ViewController: UIViewController {
    
    var map: [MapCell] = []
    var cards: [BuildingMap] = []
    var roundCards: [BuildingMap] = []
    var selectedCard: BuildingMap!
    var selecionadaDaRodada:(type1 :CardCollectionViewCell?,type2:CardCollectionViewCell?)
    private let cellMapId = "mapCollectionViewCell"
    private let cellCardId = "CardCollectionViewCell"
    var NumTurnos = 0
    var popularidade = 50
    var inicPrivada = 50
    var recursos = 200
    var arrec = 0
    var indicePopulacao = 15
    var indiceInicPrivad = 0
    
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var mapCollection: UICollectionView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var resourcesLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var privateLabel: UILabel!
    
    @IBOutlet weak var resourcesUserLabel: UILabel!
    @IBOutlet weak var incomeUserLabel: UILabel!
    @IBOutlet weak var populationUserLabel: UILabel!
    @IBOutlet weak var privateUserLabel: UILabel!
    
    let columnLayoutMap = ColumnFlowLayout(
        cellsPerRow: 4,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 200)
    )
    
    let columnLayoutCard = ColumnFlowLayout(
        cellsPerRow: 5,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapCollection.delegate = self
        self.mapCollection.dataSource = self
        self.mapCollection.collectionViewLayout = columnLayoutMap
        
        self.cardCollection.delegate = self
        self.cardCollection.dataSource = self
        self.cardCollection.collectionViewLayout = columnLayoutCard
        
        for x in 0...15{
            self.map.append((id: x, type: Location.periferica, building: nil))
        }
        
        self.map[5].type = Location.central
        self.map[6].type = Location.central
        self.map[9].type = Location.central
        self.map[10].type = Location.central
        
        self.cards = [(Hospital(), .anywhere, nil),
                      (Park(), .anywhere, nil),
                      (Habitation(), .periferica, nil),
                      (Habitation(), .central, nil),
                      (School(), .periferica, nil),
                      (School(), .central, nil),
                      (Factory(), .anywhere, nil),
                      (Factory(), .anywhere, Habitation()),
                      (Shopping(), .anywhere, Habitation()),
                      (Shopping(), .anywhere, nil),
                      (LuxBuilding(), .central, nil),
                      (LuxBuilding(), .periferica, nil)]
        
        createCards()
        self.updateDataInView()
    }
    func createCards(){
        var listaCartas : [BuildingMap] = []
        for _ in 0...4{
            listaCartas.append(self.cards.randomElement()!)
        }
        self.roundCards =  listaCartas
        
    }
    
    @IBAction func yesPressed(_ sender: Any) {
        
        self.cardCollection.visibleCells.forEach({ (cell) in
            if cell.backgroundColor == #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) {
                if let cardMapCeel = cell as? CardCollectionViewCell{
                    if selecionadaDaRodada.type1 == nil {
                        selecionadaDaRodada.type1 = cardMapCeel
                        cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    }
                    else if selecionadaDaRodada.type2 == nil && cardMapCeel != selecionadaDaRodada.type1{
                        selecionadaDaRodada.type2 = cardMapCeel
                        choicesInTurn()
                    }
                }
            }
            
        })
    }
    
    func updateDataInView(){
        resourcesUserLabel.text = "recursos: \(self.recursos)"
        populationUserLabel.text = "popularidade: \(self.popularidade)"
        incomeUserLabel.text = "arrecadação \(self.arrec)"
        privateUserLabel.text = "iniciativa privada: \(self.inicPrivada)"
    }
    
    
    @IBAction func doNothingPressed(_ sender: Any) {
        self.updateStatus(update: Status(recursos: .neutral, populacao: .minorDecrease, iniciativaPrivada: .neutral, arrecadacao: .neutral))
        nextTurn()
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mapCollection{
            return self.map.count
        }else{
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mapCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellMapId, for: indexPath) as! MapCollectionViewCell
            cell.backgroundColor = self.map[indexPath.row].type == Location.periferica ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            cell.label.text = self.map[indexPath.row].building == nil ? nil : self.map[indexPath.row].building?.name
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellCardId, for: indexPath) as! CardCollectionViewCell
            
            cell.label.text = self.roundCards[indexPath.row].building.name
            cell.backgroundColor = #colorLiteral(red: 0.2669947743, green: 0.6731787324, blue: 0.3991898, alpha: 1)
            
            cell.building = self.roundCards[indexPath.row].building
            cell.location = self.roundCards[indexPath.row].location
            
            return cell
        }
    }
    func desSelect(_ collectionView: UICollectionView , cell:UICollectionViewCell){
        collectionView.visibleCells.forEach { ( ncell
            ) in
            if ncell != cell{
                if ncell.backgroundColor != #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1){
                    ncell.backgroundColor = #colorLiteral(red: 0.2669947743, green: 0.6731787324, blue: 0.3991898, alpha: 1)
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.cardCollection {
            selectedCard = roundCards[indexPath.row]
            selectedLabel.text = selectedCard?.building.name
            let status = selectedCard?.building.Build(selectedCard?.location ?? Location.anywhere, selectedCard?.destination)
            let cell = collectionView.cellForItem(at: indexPath)
            if cell?.backgroundColor != #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1){
                cell?.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
            desSelect(collectionView,cell:cell!)
            resourcesLabel.text = "recursos: \(status!.recursos.rawValue)"
            populationLabel.text = "popularidade: \(status!.populacao.rawValue)"
            incomeLabel.text = "arrecadação: \(status!.arrecadacao.rawValue)"
            privateLabel.text = "iniciativa privada: \(status!.iniciativaPrivada.rawValue)"
        }
    }
}


extension ViewController{
    func choicesInTurn(){
        if let choice1 = selecionadaDaRodada.type1 , let choice2 = selecionadaDaRodada.type2 {
            
            var buildArray: [MapCell] = self.map.filter { (block) -> Bool in
                switch choice1.location!{
                case .anywhere:
                    return true
                case .central:
                    return block.type == Location.central
                case .periferica:
                    return block.type == Location.periferica
                }
                }.filter { (cell) -> Bool in
                    return  choice1.building.Build(choice1.location, cell.building) != nil
            }
            
            var buildBlock = buildArray.randomElement()
            
            if let buildBlock = buildBlock, let status = choice1.building.Build(choice1.location, buildBlock.building){
                self.updateStatus(update: status)
                self.map[buildBlock.id].building = choice1.building
            }
            
            buildArray = self.map.filter { (block) -> Bool in
                switch choice2.location!{
                case .anywhere:
                    return true
                case .central:
                    return block.type == Location.central
                case .periferica:
                    return block.type == Location.periferica
                }
                }.filter { (cell) -> Bool in
                    return  choice1.building.Build(choice2.location, cell.building) != nil
            }
            
            buildBlock = buildArray.randomElement()
            
            if let buildBlock = buildBlock, let status = choice1.building.Build(choice1.location, buildBlock.building){
                self.updateStatus(update: status)
                print(status)
                self.map[buildBlock.id].building = choice2.building
            }
            
            self.mapCollection.reloadData()
            nextTurn()
        }
    }
    func nextTurn(){
        selecionadaDaRodada.type1 = nil
        selecionadaDaRodada.type2 = nil
        createCards()
        self.cardCollection.reloadData()
        self.NumTurnos += 1
        
        self.updateDataInView()
        
        if self.popularidade <= 0 || self.inicPrivada <= 0 || self.recursos < 0 {
            endGame(win: false)
        }
        
        if self.popularidade == 100 && self.inicPrivada == 100 {
            endGame(win: true)
        }
    }
    
    func updateStatus(update: Status){
        self.arrec += update.arrecadacao.rawValue
        
        self.recursos += self.arrec
        self.popularidade = (self.popularidade + update.populacao.rawValue) > 100 ? 100 : (self.popularidade + update.populacao.rawValue)
        self.inicPrivada = (self.inicPrivada + update.iniciativaPrivada.rawValue) > 100 ? 100 : (self.inicPrivada + update.iniciativaPrivada.rawValue)
    }
    
    func endGame(win: Bool){
        if win == true{
            print("ganhou")
        }else{
            print("perdeu")
        }
    }
}
