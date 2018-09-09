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
    @IBOutlet weak var theOgSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSliderValue = Int(theOgSlider.value) //to set true init value of slider in currentSliderValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World", message: "Debug: Current Value: \(currentSliderValue)" + "\nDebug: Target Value: \(targetValue)", preferredStyle: .alert)
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
    }
}

