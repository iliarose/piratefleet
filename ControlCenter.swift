//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}
struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        human.addShipToGrid(mediumShip2)
        
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 4, y: 0), isVertical: true)
        human.addShipToGrid(smallShip1)
    
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 3, y: 4), isVertical: true)
        human.addShipToGrid(largeShip1)
        
        let extraLargeShip1 = Ship(length: 5, location: GridLocation(x: 6, y: 2), isVertical: true)
        human.addShipToGrid(extraLargeShip1)
        
        let mine1 = Mine(location: GridLocation(x:0, y: 3),explosionText: "Boom")
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x:7, y:0), explosionText: "Boom")
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        let numberOfGuesses = (gameStats.numberOfHitsOnEnemy) + (gameStats.numberOfMissesByHuman)
        var finalScore: Int
        
            finalScore = (gameStats.humanShipsSunk * gameStats.sinkBonus) + (gameStats.enemyShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        print("the value of final score is\(finalScore)")

        return finalScore
            }
}