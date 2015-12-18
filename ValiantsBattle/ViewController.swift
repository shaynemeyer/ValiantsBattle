//
//  ViewController.swift
//  ValiantsBattle
//
//  Created by Shayne on 12/18/15.
//  Copyright © 2015 Maynesoft LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyAttackBtn: UIButton!
    @IBOutlet weak var playerAttackBtn: UIButton!
    
    
    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Johnny Valiant", hp: 110, attackPwr: 20)
        playerHpLbl.text = "\(player.hp) HP"
        
        enemy = Enemy(name: "Billy Bad Guy", hp: 111, attackPwr: 20)
        enemyHpLbl.text = "\(enemy.hp) HP"
    }

    @IBAction func playerAttackBtnTapped(sender: AnyObject) {
        
        self.playerAttackBtn.enabled = false
        
        // wait 3 seconds then re-enable
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "disablePlayerAttackButton", userInfo: nil, repeats: false)

    }
    

    @IBAction func enemyAttackBtnTapped(sender: UIButton) {
        
        self.enemyAttackBtn.enabled = false
        
        // wait 3 seconds then re-enable
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "disableEnemyAttackButton", userInfo: nil, repeats: false)

    }
    
    func disableEnemyAttackButton() {
        self.enemyAttackBtn.enabled = true
    }
    
    func disablePlayerAttackButton() {
        self.playerAttackBtn.enabled = true
    }
}

