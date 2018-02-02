//
//  Player.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-01-26.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import Foundation

class Player {
    private var name: String
    private var score: Int
    
    init (name: String) {
        self.name = name
        self.score = 0
    }
    
    func getName() -> String {
        return self.name
    }
}
