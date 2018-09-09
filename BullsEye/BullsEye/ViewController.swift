//
//  ViewController.swift
//  BullsEye
//
//  Created by iOS Lab on 05/09/18.
//  Copyright © 2018 Mukur Panchani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    @IBOutlet weak var theOgSlider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //currentSliderValue = Int(theOgSlider.value) //to set true init value of slider in currentSliderValue
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showAlert() {
        let difference: Int = abs(currentSliderValue - targetValue)
        var points: Int = 100 - difference
        
        let customMsg: String
        let customTitle: String
        if difference == 0 {
            points += 100
            customTitle = "-=10/10 IGN=-"
            customMsg = "You Scored \(points) Points\nHere's 100 Bonus Points For You."
        } else if difference == 1 {
            points += 50
            customTitle = "Oof"
            customMsg = "You Scored \(points) Points\nYou, friend, deserve 50 more points, it was really close."
        } else if difference < 10 {
            customTitle = "Almost Had It :("
            customMsg = "You Scored \(points) Points\nI've always believed in you. Go again."
        } else if difference < 50 {
            customTitle = "YOU NEED TO FOCUS MORE"
            customMsg = "You Scored \(points) Points\nLook At Your Phone Please."
        } else {
            customTitle = "-.- Plastic Eyes -.-"
            customMsg = "You Scored \(points) Points\nThis is so sad. Alexa, Play Despacito."
        }
        score += points
        
        let alert = UIAlertController(title: customTitle, message: customMsg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cool", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentSliderValue = Int(slider.value.rounded())
    }
    
    func startNewRound() {
        currentSliderValue = Int(arc4random_uniform(100))
        targetValue = Int(arc4random_uniform(100))
        theOgSlider.value = Float(currentSliderValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

