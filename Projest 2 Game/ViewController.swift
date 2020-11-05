//
//  ViewController.swift
//  Projest 2 Game
//
//  Created by Zakhar Sidorov  on 10/27/20.
//  Copyright © 2020 Zakhar Sidorov . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    var countries: [String] = []
    var score: Int = 0
    var correctAnswer: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["uk", "us", "estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria",                  "poland", "russia", "spain"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        //title = "Choose" + "\(countries[correctAnswer].uppercased())/" + " " + "Score: \(score)"
        askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(showScore))
        
    }
    func askQuestion() {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "Choose \(countries[correctAnswer].uppercased())/" + " " + "Score: \(score)"
    }
    func alertAnswer(title: String, massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (action) in
            self.askQuestion()
        }))
        present(alert, animated: true )
        
    }
    @objc func showScore() {
        let alert = UIAlertController(title: "\(score)", message: "Is your score", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true )
    }
    

    
    @IBAction func buttonClocked(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct + 1"
            score += 1
            if score >= 5 {
                 alertAnswer(title: "Congratulate", massage: "You have already scored \(score) points")
            } else {
            alertAnswer(title: "Correct answer!", massage: "Your score is \(score)")
            
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 , execute: {
            //                self.askQuestion()
            
            }
            
        }
        else {
            title = "Oh No!"
            score -= 1
            alertAnswer(title: "Wrong!", massage: "This is \(countries[sender.tag].uppercased())")
            
        }
        
    }
    
}


