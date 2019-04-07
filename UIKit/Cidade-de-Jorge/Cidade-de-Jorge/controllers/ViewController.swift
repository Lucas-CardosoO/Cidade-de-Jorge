//
//  ViewController.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var map: [(id: Int, type: Location, building: Building?)] = []
    var cards: [Building] = []
    var roundCards: [Building] = []
    
    private let cellMapId = "mapCollectionViewCell"
    private let cellCardId = "CardCollectionViewCell"

    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var mapCollection: UICollectionView!
    @IBOutlet weak var cardView: UIView!
    
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
            print(x)
            self.map.append((id: x, type: Location.periferica, building: nil))
        }
        
        self.map[5].type = Location.central
        self.map[6].type = Location.central
        self.map[9].type = Location.central
        self.map[10].type = Location.central
        
        self.cards = [Hospital(),
                      Park(),
                      Habitation(),
                      Habitation(),
                      School(),
                      School(),
                      Factory(),
                      Factory(),
                      Shopping(),
                      Shopping(),
                      LuxBuilding(),
                      LuxBuilding()]
        
        for x in 0...4{
            self.roundCards.append(self.cards[x])
        }
    }
    
    
    @IBAction func yesPressed(_ sender: Any) {
    }
    
    @IBAction func noPressed(_ sender: Any) {
    }
    
    @IBAction func noNothingPressed(_ sender: Any) {
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mapCollection{
            return self.map.count
        }else{
            return self.roundCards.count
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
            
            cell.label.text = self.roundCards[indexPath.row].name
            cell.backgroundColor = #colorLiteral(red: 0.2669947743, green: 0.6731787324, blue: 0.3991898, alpha: 1)
            return cell
        }
    }
    
}

