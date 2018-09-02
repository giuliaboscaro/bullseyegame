//
//  ViewController.swift
//  BullsEye
//
//  Created by Giulia Boscaro on 30/08/18.
//  Copyright © 2018 Giulia Boscaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    var targetValue = 0
    
    var score = 0
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var totalScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController.init(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        updateScore()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    func updateScore() {
        totalScore.text = String(score)
    }
    
}

