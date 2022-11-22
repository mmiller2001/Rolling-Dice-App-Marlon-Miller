//
//  ViewController.swift
//  Rolling Dice App Marlon Miller
//
//  Created by Marlon Miller Matute on 11/21/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let dicePhotos = ["d1","d2","d3","d4","d5","d6","d7","d8","d9","d10","d11","d12","d13","d14","d15","d16","d17","d18","d19","d20"]
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "d1")
        LabelDisplay.text = "Ready?"
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motion == .motionShake) {
            rollDice();
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func buttonGotPressed(_ sender: UIButton) {
        rollDice();
    }
    
    @IBOutlet weak var LabelDisplay: UILabel!
    
    func rollDice() {
        let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
        let pathWin = Bundle.main.path(forResource: "torpedo", ofType: "mp3")!
        let pathLose = Bundle.main.path(forResource: "failwah", ofType: "mp3")!
        
        let url = URL(fileURLWithPath: pathToSound)
        let urlWin = URL(fileURLWithPath: pathWin)
        let urlLose = URL(fileURLWithPath: pathLose)
        
        imageView.image = UIImage(named: dicePhotos[Int(arc4random_uniform(20))])
        
        do {
            
            if(imageView.image == UIImage(named: "d20")) {
                LabelDisplay.text = "Congrats! You Won"
                audioPlayer = try AVAudioPlayer(contentsOf: urlWin)
                audioPlayer?.play()
            }
            else if(imageView.image == UIImage(named:"d1")) {
                LabelDisplay.text = "You Lost!"
                audioPlayer = try AVAudioPlayer(contentsOf: urlLose)
                audioPlayer?.play()
            }
            else {
                LabelDisplay.text = "Ready?"
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            
        } catch {
            print("This didn't work")
        }
        
    }
    
}

