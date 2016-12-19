//
//  ViewController.swift
//  BullsEye
//
//  Created by Tim Figueroa on 12/1/16.
//  Copyright © 2016 Tim Figueroa. All rights reserved.
//  First Apprentice App



//import libary of needed features
import UIKit



class ViewController: UIViewController {
    var difference : Int = 0 // a calculated value
    var randomValue : Int = 0 //a random number value
    var currentSliderValue : Int = 0 //the slider value
    let setSliderToo : Int = 50 //use to set the slider to 50
    var howClose : String = "" //how close you got comment
    var yourScore : String = "" //calculated score
    var scoreValue : Int = 0 //value assigned per difference
    var totalScore : Int = 0 //total game score
    var rounds : Int = 0 //number of rounds played
    
    //this section makes code and UI element visible
    @IBOutlet weak var _slider: UISlider!
    @IBOutlet weak var randomNum: UILabel!
    @IBOutlet weak var numRounds: UILabel!
    @IBOutlet weak var score: UILabel!
    
    //This section checks load and initializes vars at start
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the current slider value
        print("Number 1")
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        _slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        _slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        _slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        _slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        _slider.value = Float(setSliderToo)
        playARound()
        generateRandomNum()
        updateRandomValue()
        updateRounds()
        updateScore()
        printVarsToConsole()
    }
    
    //This section checks for errors
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Number 2")
        }
    
    //This section responds to hit me
    @IBAction func showAlert() {
        print("Nubmer 3")
        print("next round")
        difference = (abs(randomValue - currentSliderValue))
        scoreLogic()
        let alert = UIAlertController(title: "Hello lets Play!", message: "The target value is: \(randomValue)" + "\n The value of your guess is: \(currentSliderValue)" + "\n \(howClose)" + "\n \(yourScore)", preferredStyle: .alert)
        
        //When users select Next in the alert pop up
        
        let action = UIAlertAction(title: "Play", style: .default, handler: {Action in  self.generateRandomNum(); self.updateRandomValue(); self.playARound(); self.updateRounds(); self.updateScore(); self.printVarsToConsole()  })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            print("you hit play")
            _slider.value = Float(setSliderToo)
       }

    //detect when slider moves and capture its value
    @IBAction func sliderMoved(_slider: UISlider) {
        print("Number 4")
        
        //get slider value
        currentSliderValue = lroundf(_slider.value)
       }
    
    //start a new game
    @IBAction func startOver() {
        startNewGame()
    }
    
    //set var to render the random value
    func updateRandomValue() {
        randomNum.text = String(randomValue)
      }
    
    //set var to render the number of rounds
    func updateRounds() {
        numRounds.text = String(rounds)
      }
    
    //set var to render the total score
    func updateScore() {
        score.text = String(totalScore)
      }
    
    //score logic - how close is the user slider guess
    func scoreLogic() {
        
        if difference == 0 {
            howClose = "Perfect Guess!"
            scoreValue = 75
            yourScore = ("Your score is: \(scoreValue)")
        } else
            if difference > 0 {
            if difference <= 10 {
            howClose = "Oooo Almost"
            scoreValue = 50
            yourScore = ("Your score is: \(scoreValue)")
        } else
            if difference > 10 {
            if difference <= 20 {
            howClose = "Good Guess"
            scoreValue = 25
            yourScore = ("Your score is: \(scoreValue)")
        } else
            if difference > 20 {
            howClose = "Not Close!"
            scoreValue = 10
            yourScore = ("Your score is: \(scoreValue)")
            }
            }
            }
            }
    
    // increment and set vars for the round
    func playARound() {
        rounds += 1
        totalScore = totalScore + scoreValue
    }
    
    // generate a random value between 1 & 100
    func generateRandomNum() {
        randomValue = 1 + Int(arc4random_uniform(100))
    }

    //Print variable values to console
    func printVarsToConsole() {
    print("rounds = \(rounds)")
    print("totalScore = \(totalScore)")
    print("randomValue = \(randomValue)")
    print("currentSliderValue = \(currentSliderValue)")
    print("difference: \(difference)")
    print("howClose: \(howClose)")
    print("score Value: \(scoreValue)")
    print("Your Score: \(yourScore)")
    print("difference: \(difference)")
    print("slider Value: \(currentSliderValue)")
    }
    
    func startNewGame() {
        rounds = 0
        scoreValue = 0
        difference = 0
        currentSliderValue = 0
        totalScore = 0
        howClose = ""
        yourScore = ""
        updateRounds()
        updateScore()
        viewDidLoad()
    }
}
