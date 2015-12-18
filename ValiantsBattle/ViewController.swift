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
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var startOverBtn: UIButton!
    
    @IBOutlet weak var enemyAttackBtn: UIButton!
    @IBOutlet weak var enemyAttackBtnLbl: UILabel!
    @IBOutlet weak var playerAttackBtn: UIButton!
    @IBOutlet weak var playerAttackBtnLbl: UILabel!
    
    
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
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enablePlayerAttackButton", userInfo: nil, repeats: false)
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.name) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "\(player.name) Wins!!!"
            enemyImg.hidden = true
            
            gameOver()
        }

    }
    

    @IBAction func enemyAttackBtnTapped(sender: UIButton) {
        
        self.enemyAttackBtn.enabled = false
        
        // wait 3 seconds then re-enable
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableEnemyAttackButton", userInfo: nil, repeats: false)
        
        if player.attemptAttack(enemy.attackPwr) {
            printLbl.text = "Attacked \(player.name) for \(enemy.attackPwr) HP"
            playerHpLbl.text = "\(player.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if !player.isAlive {
            playerHpLbl.text = ""
            printLbl.text = "\(enemy.name) Wins!!"
            playerImg.hidden = true
            
            gameOver()
        }
        
        

    }
    
    
    @IBAction func startOverBtnTapped(sender: AnyObject) {
        gameStart()
    }
    
    func enableEnemyAttackButton() {
        self.enemyAttackBtn.enabled = true
    }
    
    func enablePlayerAttackButton() {
        self.playerAttackBtn.enabled = true
    }
    
    func gameOver() {
        self.startOverBtn.hidden = false
        
        
        
        // hide attack buttons
        self.enemyAttackBtn.hidden = true
        self.enemyAttackBtnLbl.hidden = true
        self.playerAttackBtn.hidden = true
        self.playerAttackBtnLbl.hidden = true
        // show players
        self.playerImg.hidden = true
        self.playerHpLbl.hidden = true
        self.enemyImg.hidden = true
        self.enemyHpLbl.hidden = true
    }
    
    func gameStart() {
        // hide start over button
        self.startOverBtn.hidden = true
        
        // reset message.
        self.printLbl.text = "Welcome to Valiants Battle."
        
        // show attack buttons
        self.enemyAttackBtn.hidden = false
        self.enemyAttackBtnLbl.hidden = false
        self.playerAttackBtn.hidden = false
        self.playerAttackBtnLbl.hidden = false
        // show players
        self.playerImg.hidden = false
        self.playerHpLbl.hidden = false
        self.enemyImg.hidden = false
        self.enemyHpLbl.hidden = false
        
    }
}

