//
//  Enemy.swift
//  ValiantsBattle
//
//  Created by Shayne on 12/18/15.
//  Copyright © 2015 Maynesoft LLC. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    private var _name = "Enemy"
    
    var name: String {
        get {
            return _name
        }
    }
    
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
}