//
//  ViewController.swift
//  BullsEye
//
//  Created by user206341 on 10/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        currentValue = lroundf(slider.value)
//        targetValue = Int.random(in: 1...100)
//
//        targetLabel.text = String(targetValue)
//        scoreLabel.text = String(score)
//        roundLabel.text = String(round)
        
        startNewGame()
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }

    func startNewRound(){
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        round += 1
       
        updateLabels()
    }

    func updateLabels(){
        slider.value = Float(currentValue)
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
    }
    
    //MARK: - action methods
    @IBAction func showAlert(){
        
        var scoreRound = 100 - abs(currentValue - targetValue)
        
        // change title to correspond scoreRound
        var title = ""
        if(scoreRound == 100){
            title = "Perfect!"
            scoreRound += 100
        }else if(scoreRound == 99){
            title = "You almost had it!"
            scoreRound += 50
        }else if(scoreRound >= 90){
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }

        let message = "The current value of slider is: \(currentValue)\nTarget is: \(targetValue)\nYour score is: \(scoreRound)"
//        let message = "The current value of slider is: \(currentValue)\nYour score is: \(score)"

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: "Awsome", style: .default, handler: nil)
        // start new round after user click action
        //let action = UIAlertAction(title: "OK", style: .default, handler: {_ in self.startNewRound()})
        // trailling closure
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            self.startNewRound()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        score += scoreRound
//        startNewRound()
    }
    
    @IBAction func startOver(){
            startNewGame()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("User moved slider, position: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
}

