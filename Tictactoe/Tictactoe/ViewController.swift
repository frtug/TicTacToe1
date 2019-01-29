//
//  ViewController.swift
//  Tictactoe
//
//  Created by Abhishek Sharma on 22/12/18.
//  Copyright © 2018 Abhishek Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu1: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu9: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buselect(_ sender: Any) {
        let buse = sender as! UIButton
        playgame(buse: buse)
    }
    var activeplayer = 1;
    var player1 = [Int]()
    var player2 = [Int]()
    
    func findwinner(){
        // row 1
        var winner = -1;
        
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)){
            winner = 1;
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)){
            winner = 2;
        }
        // row 2
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)){
            winner = 1;
            
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)){
            winner = 2;
        }
        // row 3
        
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)){
            winner = 1;
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)){
            winner = 2;
        }
        
        // column 1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)){
            winner = 1;
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)){
            winner = 2;
        }
        
        // column 2
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)){
            winner = 1;        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)){
            winner = 2;
        }
        
        // column 3
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)){
            winner = 1;
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)){
            winner = 2;
        }
        
        // Cross 1
        if (player1.contains(1) && player1.contains(5) && player1.contains(9)){
            winner = 1;
        }
        if (player2.contains(1) && player2.contains(5) && player2.contains(9)){
            winner = 2;        }
        
        // Cross 2
        if (player1.contains(3) && player1.contains(5) && player1.contains(7)){
            winner = 1 }
        if (player2.contains(3) && player2.contains(5) && player2.contains(7)){
            winner = 2;
        }
        
        
        if winner != -1{
            
            var msg = ""
            
            if winner == 1 {
                msg = "Player1 is winner";
            }
            else{
                msg = "Computer is winner";
            }
            // print(msg);
            
            
            let alert = UIAlertController(title: "winner", message: msg , preferredStyle: UIAlertController.Style.alert);
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert,animated:true,completion:nil)
        }
    }
    
    
    func playgame(buse:UIButton){
        if activeplayer == 1{
           buse.setTitle("X", for: UIControl.State.normal)
            buse.backgroundColor = UIColor(red: 102/255, green: 90/255, blue: 34/255, alpha: 0.4)
            activeplayer = 2;
            player1.append(buse.tag)
            print(player1)
            autoplay();

        }else{
            buse.setTitle("O", for: UIControl.State.normal)
            buse.backgroundColor = UIColor(red: 200/255, green: 190/255, blue: 211/255, alpha: 0.5)
            activeplayer = 1;
            player2.append(buse.tag)
            print(player2)
        }
        buse.isEnabled = false;
        findwinner()
    }
    
    func autoplay(){
        //scan for empty cells
        var emptyCells = [Int]();
        for index in 1...9{
            if !(player1.contains(index) || player2.contains(index)){
                emptyCells.append(index);
                
            }
        }
        let randIndex =  arc4random_uniform(UInt32(emptyCells.count) )
        let CellId = emptyCells[Int(randIndex)];
        var buse:UIButton?;
        switch CellId {
        case 1 :
            buse  = bu1;
        case 2 :
            buse  = bu2;
        case 3 :
            buse  = bu3;
        case 4 :
            buse  = bu4;
        case 5 :
            buse  = bu5;
        case 6 :
            buse  = bu6;
        case 7 :
            buse  = bu7;
        case 8 :
            buse  = bu8;
        case 9 :
            buse  = bu9;
        default:
            buse = bu1;
        }
        playgame(buse:buse!);
    }
    
}




