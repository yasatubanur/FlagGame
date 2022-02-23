//
//  ViewController.swift
//  FlagGame
//
//  Created by Tuba Nur YAŞA on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","irland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Show your score", style: .plain, target: self, action: #selector(showScore))
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action : UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        totalQuestion += 1
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            title = "Wrong thats the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle:.alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        if totalQuestion > 10{
            title = "Game over! Your Score is \(self.score) "
            ac.addAction(UIAlertAction(title: "Finish", style: .cancel, handler: .none))
        }
        
        
        present(ac, animated: true)
    }
       @objc func showScore(){
        let scoreAlert = UIAlertController(title: "Score", message: "hey", preferredStyle: .actionSheet)
        scoreAlert.addAction(UIAlertAction(title: "Your score is \(score)!", style: .default, handler: nil))
        present(scoreAlert,animated: true)
                                                           }
    
    
}

